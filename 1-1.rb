
str1="string"
str2="string"

str1.object_id	#=> 84640: ある文字列オブジェクト
str2.object_id	#=> 84620: 異なる文字列オブジェクト
str1 == str2 #=> true: 内容は同じ
str1.equal?(str2) #=> false: 内容は同じでもオブジェクトとしては異なる
