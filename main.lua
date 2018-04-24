-----------------------------------------------------------------------------------------
--
-- Faiyaz Hossain
-- 2018-04-23
--
-----------------------------------------------------------------------------------------


display.setStatusBar(display.HiddenStatusBar)

local answerText 
local answer = 0
local numberA
local numberB
local numberANegative = false
local numberBNegative = false
local numberAAndBNegative = false

local instructions = display.newText( 'Enter the two numbers to be multiplied:', display.contentCenterX, 1000, native.systemFont, 110 )
instructions.id = "instructions"

local numberATextField = native.newTextField( 415, 1425, 300, 128)
numberATextField.id = "Number A Text Field"
local numberBTextField = native.newTextField( 1100, 1425, 300, 128)
numberBTextField.id = "Number B Text Field"
local xSymbol = display.newText( "X", 750, 1425, native.systemFont, 128)
xSymbol.id = "X Symbol"
local equalsSymbol = display.newText( "=", 1400, 425, native.systemFont, 128)
equalsSymbol.id = "Equals Symbol"
local enterButton = display.newImageRect( 'Button.png', 625, 300 )
enterButton.x = display.contentCenterX -100
enterButton.y = 750
enterButton.id = "Enter Button"

local function onEnterClicked( event )
	-- Defining
	numberA = numberATextField.text
	numberB = numberBTextField.text
	-- Checking 
	if string.match( numberA, '%-' ) and string.match( numberB, '%-' ) then 
		
		numberA = string.gsub(numberA, '%-', '' )
		numberB = string.gsub(numberB, '%-', '' )
		numberAAndBNegative = true
		
	elseif string.match( numberA, '%-' ) then 

		numberA = string.gsub(numberA, '%-', '' )
		numberANegative = true
	
	elseif string.match( numberB, '%-' ) then
		numberB = string.gsub(numberB, '%-', '' )
		numberBNegative = true
	end
		
	-- Loop

	for timesAdded=1, numberB do
		answer = answer + numberA
	end
	
	if numberAAndBNegative == true then
		answerText = display.newText( answer, 1800, 425, native.systemFont, 128 )
	elseif numberANegative == true or numberBNegative == true then
		answerText = display.newText( '-' .. answer, 1800, 425, native.systemFont, 128 )
	else
		answerText = display.newText( answer, 1800, 425, native.systemFont, 128 )
	end


	print( answer )


end


enterButton:addEventListener( 'tap', onEnterClicked)