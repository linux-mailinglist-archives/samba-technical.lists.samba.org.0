Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6235684637D
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 23:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6NYsJO2ADFnfYNSUKy8Dw9cwok9fDPUDcRUYaa08xhE=; b=J+1U5j+u0+NvK/oFd0Jb/4hEr9
	2/KBtxn0TeoQhayfpKeO5jUMQKfn+R9Dd3hkuHAkO8q96UMgbxpYMa7YGafR0abVJTGCQKlTVjqq2
	eX6FMCg8+IGFfzrbR0AsTlwcyWQgWfPoaDylCWO4o7R4cC/ISZzaBLU/1x3xWZyQ7LYP394/ZiTLw
	xcLvifxZcbQqnIRunVnAUlR0B+ZRgZX0Sjnxavj1ta+GVBhoLcoTV6k/u7rBPPN39CUnR2XfsdsLH
	ptt2bFu5vmcYMdAR+Yb63AQRWE7R3qxPnZUggpihWKqivABPlZzG/AHjSiNUPAKir5sTNgJX5n6Ex
	mAwEdHGQ==;
Received: from ip6-localhost ([::1]:31940 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVfdQ-007Jb3-Gi; Thu, 01 Feb 2024 22:34:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:53601) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVfdL-007Jaw-Jy
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 22:34:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a35e9161b8cso204995366b.3
 for <samba-technical@lists.samba.org>; Thu, 01 Feb 2024 14:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706826850; x=1707431650; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6NYsJO2ADFnfYNSUKy8Dw9cwok9fDPUDcRUYaa08xhE=;
 b=k7YkPYBvQI1t9TWZK6MTDuouXnhNVqwdKpFslM1V4TztSVYBjS655QeCVQBTaUzcds
 73FQ5JpPDuSASk/9JQ588Vt/fvl7vVyIjQlIa6qV+ISYw36eJT4j4JL2xQ3FCPsospig
 IAKAAcGC3oVIDWYHswSoFdB+7BYH+0B82nuXcTwJrYf3C2AQeXOC6+EGnDEA0+HBZU1F
 TJbVP3UI4IQ74zJr5t9MwQt0rCds17TFpnICCeDUioo6X+dH/9MsXsbtPBz/P83YTb7q
 Hys72P3zZ5ESe1B+MEFcFTwLuVju5Nkv0zFYynSbH8QdKhXq8/2nzUdnXeCsFG/BccM6
 Anng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706826850; x=1707431650;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6NYsJO2ADFnfYNSUKy8Dw9cwok9fDPUDcRUYaa08xhE=;
 b=n0sbvudAgtKFBMdDg7Exq6+9jVeAy3wEo86RDLoKCmsyaE9/j//9jXOe67/3RIjESv
 1eSo5/F/kFrmgN7TJfAWi0+fOHLWKRn9ICRunFdZnhVX4j0m0PHHJ+iC+wWte+PTZz/e
 eamacBcKnSS1d2evzL6Tk6ofrYK9QjrSsWK/LJ7OJT2/CAYwgWBijNjU+Ec+GAzwQe5g
 kl+gLvKFsuD/9I2PNUeRJBbgQ4P+AkpddD7Gv805y7micBsyNmMtmuNeTrjf6sfOPcbY
 IJ1kPg2KLfqULMp/5WZH8JZhQLJOq9vJs+LhKGw8n6aLwgYL4luf6BYykAZkFqfzwcBb
 DXTg==
X-Gm-Message-State: AOJu0YxYjqgCHwAj0c7lgWiw5jfoskbosFs126x/4jl5POcscCTD7suz
 LrvhhHdc+tBLmSvSpQ7Ouc8//IqBn4rHRAqTkjEhSjgRtlBRqSQ7i60jwqne
X-Google-Smtp-Source: AGHT+IHNQEB6DF77tCea/aGJSzTXB7kWSpRY077i3jHA8JVoOvdCHUPiNS6ZG68bzoEumdpFIFW0qQ==
X-Received: by 2002:a17:906:13d0:b0:a36:7c26:b6f with SMTP id
 g16-20020a17090613d000b00a367c260b6fmr277839ejc.52.1706826850146; 
 Thu, 01 Feb 2024 14:34:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW08w7xOjQD+/6IyIDJGW8MrrsXvW+hq9Yk7nqUj/BMUsR0anyrXMG6Ov6xIje0AinKNYMF8a2tWkrNjsRY/eqds5k2ltiEohXLLYzgrDUU
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 ds3-20020a170907724300b00a34a20b247fsm223128ejc.84.2024.02.01.14.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 14:34:09 -0800 (PST)
Message-ID: <e50b5dc3-0859-4cad-8a94-021fb0b5517d@gmail.com>
Date: Thu, 1 Feb 2024 23:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
Content-Language: nl, en-US
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
 <df237dc3-d1b9-41ab-823a-fbac5ce9df22@catalyst.net.nz>
In-Reply-To: <df237dc3-d1b9-41ab-823a-fbac5ce9df22@catalyst.net.nz>
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
From: Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kees van Vloten <keesvanvloten@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 01-02-2024 22:33, Douglas Bagnall wrote:
> hi Kees,
>
>> Still, if you know what this powershell call changes in the LDAP 
>> record of the group, the user or elsewhere in LDAP, you can mimic 
>> this functionality quite easily with a little cron script on the DC.
>
> I had similar thoughts, but it sounds this Windows Server 2016 feature 
> is a bit cleverer than that -- in particular, the KDC will not issue 
> tickets that outlive an expiring group.
>
> cheers,
> Douglas
>
Thanks for providing more background, Douglas!

- Kees.


