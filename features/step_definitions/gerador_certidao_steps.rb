# frozen_string_literal: true

Quando('chamar o endpoint de certidão de nascimento') do |table|
  @table = table.rows_hash

  payload = {}
  payload['acao'] = 'gerador_certidao'
  payload['pontuacao'] = @table['pontuacao'][0].upcase
  payload['tipo_certidao'] = @table['tipo_certidao']

  @response = ForDevs.post('/ferramentas_online.php', body: payload)
end

Entao('validar o retorno do endpoint de certidão de nascimento') do
  expect(@response.code).to eql(200)

  if @table['pontuacao'].eql?('sim')
    expect(@response.include?(' ')).to be_truthy
    expect(@response.include?('-')).to be_truthy
    @response.gsub!(' ', '').gsub!('-', '')
  else
    expect(@response.include?(' ')).to be_falsey
    expect(@response.include?('-')).to be_falsey
  end

  expect(@response.length.between?(31, 32)).to be_truthy
end
