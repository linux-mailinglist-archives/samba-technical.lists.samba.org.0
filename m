Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA76DF4B0
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 14:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=g3C55zDICTMlERkzoTmiDFxhq6MMJxxOMh1WK90Rff0=; b=jmyx9y7g2G4ZwObXlBx3HCh4qP
	+ZYexa+EBQenMab1faH/rdCH+Q0UGdIroUu9DOFo2XniKMV9BcoD5ILXvLKonQLGIP7DUySd7+RjG
	yKAOY7yrpsLu/f62m5lEpg3/KNB8XBkybIL1uYui8XfNWGVBJi8me3NeVsb/81R4MmGmPUAVNmYm0
	KnIbL77Dd76riiU1fxteGxnlFgb9kdKhGCDgTYjETBtRLm3PAoYfLo8l8Ps2gnG39da9lZJeEoig/
	U/NNFWztyjHkSuK4D9nbS23Jq93y8c+KVSpcLfuKOqwtLeigWb5txZP5/BMRcWHcqBcyKnlt17tku
	WaNvYvhQ==;
Received: from ip6-localhost ([::1]:49412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmZHY-000jxL-Jj; Wed, 12 Apr 2023 12:09:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54819) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmZHT-000jxC-EL
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 12:08:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id q5so6368541wmo.4
 for <samba-technical@lists.samba.org>; Wed, 12 Apr 2023 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comind-io.20210112.gappssmtp.com; s=20210112; t=1681301334;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g3C55zDICTMlERkzoTmiDFxhq6MMJxxOMh1WK90Rff0=;
 b=kW0wr6Nd+FWvvNLwAy+KkEj6QPHq5s/NAKTV2eftwqz4REIT/b0HzMLK14nhWTsHmw
 auDoHUCvHRcMNdXkuoCWjsPTLyBfgVk9qtq2CkmHJTpfJfAfcDdO3mt+pYHSvK3YPss/
 ZWZyqWFr6sTL+vRmCyzX+1ycN2HRnRzkIqkhpRN95nVLgAoSmmOL8ncMYHJ/BQ9itAoN
 n9kYF8KSHSObPkcbeXVPljVy6APp7lwjJHUcZ2uUI2oOsoADtQCPzJrewOom/dscdEsU
 9TQmLyXXVVnw6lCa2XGpiQD+DXJJ5u4I373I1KkSS/I5/wR0i38aDmLz8OrXajXII+0z
 qqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681301334;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g3C55zDICTMlERkzoTmiDFxhq6MMJxxOMh1WK90Rff0=;
 b=jy/sGFQgZAYLCB05tuRD/L9H1BTdyJ+PwwJt5XStaT1WKbMl41TE9Kj0eq2SwJmDnV
 tYxc0fimLm+RNrLdFJcHQVdIHb36iELCDRDsdkU0sc/tpyKmlhZa0NTwCnj9BTutmzf5
 YOZeTwvZUWD25jcPAC8DwJtUfvJFk3jUYd5DtvmkXBJhPQ/qvtp2bt/QScIeCpglwlzZ
 7+r6eBqCKd3WoAXpZoEPZIE9mlaZglVDkx6SXiaz7GVQu8u85astPGbf+KPQ/4+ZO+C8
 LnYr7iLutSKnGgjUTrReTqDkfXxn7Kk3jbTOFVueh7MGI+L2qo2XjQfNiexVtW2WdvNO
 60tA==
X-Gm-Message-State: AAQBX9csaFAYewyYj3Su+zFfwyODxo7p6uppMwuOrtqNngvKNZTwQq/A
 PUTOZGKy42ASq60pui+h2em+kuSH5DutbRjON9c=
X-Google-Smtp-Source: AKy350ZUZVd57RgBP8W+5FWsrOkqc6FqLGfruLz+N+amU4loNkUj8RpKcfFFRWU2WQKtSdfRIoMlUQ==
X-Received: by 2002:a7b:c3d4:0:b0:3f0:7f4b:f3ab with SMTP id
 t20-20020a7bc3d4000000b003f07f4bf3abmr4640450wmj.5.1681301334201; 
 Wed, 12 Apr 2023 05:08:54 -0700 (PDT)
Received: from [192.168.50.106] (83-244-193-76.cust-83.exponential-e.net.
 [83.244.193.76]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b003ee1e07a14asm2186086wmq.45.2023.04.12.05.08.53
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:08:53 -0700 (PDT)
Message-ID: <086d9c84-1e58-2309-7903-ca2130d45c2c@comind.io>
Date: Wed, 12 Apr 2023 13:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: How to test samba LDAP parameters with openldap tools, eg
 ldapsearch?
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
 <19d97578-4936-6197-871a-5996f32cfd54@samba.org>
 <d1cc4ccf-a8a0-0ef5-e418-1e406490fa80@comind.io>
 <0ca6506a-af76-a2ec-626a-5ee11ef7952e@samba.org>
In-Reply-To: <0ca6506a-af76-a2ec-626a-5ee11ef7952e@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Jan Andersen via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jan Andersen <jan@comind.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Rowland,

No, I wasn't aware of that; is it necesary in order to make LDAP work as 
I intended? I only run samba in order to provide disk access for the 
minority of our employees who prefer windows in an otherwise Linux 
environment.

Jan

On 12/04/2023 12:06, Rowland Penny via samba-technical wrote:
> 
> 
> On 12/04/2023 11:39, Jan Andersen wrote:
>> Hi Rowland,
>>
>> Thank you for replying. I wiped the existing logs, changed the smbd 
>> service to include '-d 10' and restarted, so I would have logs without 
>> too much noise - please find them attached along with smb.conf
>>
>>
> 
> You appear to be running Samba as a standalone server with an ldap 
> backend, are you aware that such a setup is two parameters away from 
> being a PDC ? If you comment out 'server role = standalone server' and 
> add 'domain logons = yes', it becomes a PDC and a PDC (from 4.8.0) 
> requires winbind to be running.
> 
> Rowland
> 
> 

