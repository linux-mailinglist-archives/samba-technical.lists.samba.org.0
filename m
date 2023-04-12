Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C46DF725
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 15:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JiD/XJ6HYIYmP+rPeO6kTbFauVtwXc6JunDFTmEyA/I=; b=KUTFkQQfodWoR3QRHmt/6TgWyQ
	+sNXuKwPnjsTaWLbke5YWif+tZ2ky3Q2wIPi0fZD99Y6bl6d+KeyBQHN7USa+dazYPqIMe4ezT5iV
	I3NSHlw61H8+7mBZ898PMgLQVsiZ6OIivnEGGCj8YBsdRXY+mgIFsguwe7shEMAsanECq/xHa4nTt
	2X/nPWQ6iU++GsbHFioCa+vAB6REjLFJAfz6rh6WJ4aJ+jKH+6zajbfGICb4HZwZjietLYaK41+6O
	okSxuL51lNsabl93jtAAVOG5CKvtKytNym4QkivYZ0BCZuVEjxMStQWs+bNXvn6MFaMkpIKnOcWyb
	q5SISvlA==;
Received: from ip6-localhost ([::1]:41174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmaTZ-000m1l-6K; Wed, 12 Apr 2023 13:25:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42633) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmaTT-000m1c-SQ
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 13:25:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so6176309wms.1
 for <samba-technical@lists.samba.org>; Wed, 12 Apr 2023 06:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comind-io.20210112.gappssmtp.com; s=20210112; t=1681305922;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JiD/XJ6HYIYmP+rPeO6kTbFauVtwXc6JunDFTmEyA/I=;
 b=k82IwR5gtILGZBntZ+Z8M0SLhJLCg0TY6BqgaI1my6MDZUdS0nOGK/llBkakYCRkY1
 IJ4mR2SF7bJXH8i9kcKRT2WT8O5aZgMWJJk2WlhPGsLCNzu92KVYsklBVQC8WsqR3cmR
 GQMO1BlA596q8yLgD3xKifH+JaUmOSRNFpFxibd2aRoBicnN3ZTzPtwzn+7EiPANaDDb
 tCXeAqg7A1eEXAS+2Jbb84Ws1S5Ga6u+rNNoM10eYSDMO9zVI62OY9xNjFRXhDFO9Y30
 RglEmlbFZ2HP9oA+ZJf01cOCuLwcah1fQTXqM6k77b+aqijgWJPFbNQSo/ns4EcBjBy8
 LXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681305922;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JiD/XJ6HYIYmP+rPeO6kTbFauVtwXc6JunDFTmEyA/I=;
 b=eXY320ZhILHEB226Wgrl+3jnsO8AOCgL/nUD7WkQ7at31DydELY/AOkseiMKtLRPzM
 P8ljeh97L0/eom7F3Vuw50UfBCpDoUJGgibPdlEeLefwsHQGT9PXgxB1ik/2ijfq7X09
 Vvo9PSWl8/WIIOmVhYVww7hUlFyXrS7z8TV4uR7/nE0Gqsuk0/Y3LRU28JCc2aCu/E3r
 Yotlq3FSiuN8s5pRW3p97u4Xa35QIeLOJS+2mSMvoHBhnHuWR+zIgmyXzeCm2tbNFizt
 iWV6W0vLzNsJ/4CGZ7KdSFA9MHh5WglJJ94LIGTd9QHx5aEdElgMBXbF/9TNudEtoT7q
 oVlg==
X-Gm-Message-State: AAQBX9dR1kJAJmag3HoDYEF2Z7REQjBxmgOwn7s9aH6wHe8ToklaW8+g
 BSCC2cYESJSLxo+XFKG5Kou6ji7M/hbJEGPkT7U=
X-Google-Smtp-Source: AKy350aMQB8ifRLFbZZfB4ET5ZzEqabguqJIZJXBYQlxTlbVWheDiTjPEOxU7Sem/HWel+gfPZ90/Q==
X-Received: by 2002:a7b:ca41:0:b0:3f0:46ca:f201 with SMTP id
 m1-20020a7bca41000000b003f046caf201mr1993426wml.1.1681305922467; 
 Wed, 12 Apr 2023 06:25:22 -0700 (PDT)
Received: from [192.168.50.106] (83-244-193-76.cust-83.exponential-e.net.
 [83.244.193.76]) by smtp.gmail.com with ESMTPSA id
 v18-20020adff692000000b002f006333c89sm9899918wrp.61.2023.04.12.06.25.22
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:25:22 -0700 (PDT)
Message-ID: <00e763ed-ec70-c36c-dbb7-a6d129425047@comind.io>
Date: Wed, 12 Apr 2023 14:25:21 +0100
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
 <04c86436-6665-354f-84b5-479613a81545@comind.io>
 <93859d7c-eaf9-0a93-a236-53a172381782@samba.org>
 <CAB5c7xoHu91S2W6Ux=RfrhJRJ-_FWgPmgPJM7KzwCvuNypYTMQ@mail.gmail.com>
 <222fb09f-249d-54d6-ad0d-54159c96bbd9@samba.org>
In-Reply-To: <222fb09f-249d-54d6-ad0d-54159c96bbd9@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi everybody - thank you for helping and for all the good advice! I will 
certainly look into it and take on board as soon I get the chance to 
address the issues - at the moment it is simply a question of making 
this work at a basic level, regrettably.

As it turned out, there was a configuration mistake on the LDAP server, 
so the domain/workgroup smbd was looking for, was empty; the name was 
wrong on the server side. After fixing that things are now working and I 
can move towards persuading people about making sensible improvements.

Thanks again!

Jan

On 12/04/2023 14:04, Rowland Penny via samba-technical wrote:
> 
> 
> On 12/04/2023 13:58, Andrew Walker wrote:
>> On Wed, Apr 12, 2023 at 7:51 AM Rowland Penny via samba-technical
>> <samba-technical@lists.samba.org> wrote:
>>>
>>>
>>>
>>> On 12/04/2023 13:37, Jan Andersen wrote:
>>>> Hi Rowland,
>>>>
>>>> I noticed something odd about the logs: it seems smbd generates one 
>>>> both
>>>> for the workstation's name and one for its IP address - I didn't attach
>>>> the latter, so here it is. It seems to have more detail.
>>>>
>>>> Jan
>>>>
>>>> On 12/04/2023 12:06, Rowland Penny via samba-technical wrote:
>>>>>
>>>>>
>>>>> On 12/04/2023 11:39, Jan Andersen wrote:
>>>>>> Hi Rowland,
>>>>>>
>>>>>> Thank you for replying. I wiped the existing logs, changed the smbd
>>>>>> service to include '-d 10' and restarted, so I would have logs
>>>>>> without too much noise - please find them attached along with 
>>>>>> smb.conf
>>>>>>
>>>>>>
>>>>>
>>>>> You appear to be running Samba as a standalone server with an ldap
>>>>> backend, are you aware that such a setup is two parameters away from
>>>>> being a PDC ? If you comment out 'server role = standalone server' and
>>>>> add 'domain logons = yes', it becomes a PDC and a PDC (from 4.8.0)
>>>>> requires winbind to be running.
>>>>>
>>>>> Rowland
>>>>>
>>>>>
>>>
>>> Before Samba 4.8.0 , smbd could directly connect to the domain
>>> controller, from 4.8.0 smbd now needs to go via winbind.
>>> Now I know that you are not strictly running a PDC, but what you are
>>> running is the next thing to it, so I presume that you need to run
>>> winbind, you do not need to configure anything, just run winbind.
>>>
>>> Whatever happens, you should be aware that Samba is working to remove
>>> SMBv1 and things like PDC's with it.
>>>
>>> One thing I did notice from that last log, you are not using SMBv1, try
>>> adding these lines to the smb.conf:
>>>
>>> server min protocol = NT1
>>> client min protocol = NT1
>>>
>>> Rowland
>>>
>>
>> It's probably also worth noting that doing this requires your LDAP
>> schema to contain all the fields you need to generate a valid passbd
>> entry for users. Do note that using this schema requires storing an
>> MD4 of your users passwords _and_ having those accessible to the file
>> server (hence discussion of this being a de-facto PDC). My general
>> feeling is that this goes beyond my risk tolerance for a production /
>> business environment.
>>
>> Andrew
> 
> Totally agree with you Andrew, I wouldn't use it in production, but from 
> my understanding it did work and presumably the OP has upgraded and it 
> has stopped working.
> 
> If this isn't the case and it is a new setup, then I would suggest the 
> OP stops what he is trying and sets up a DC instead.
> 
> Rowland
> 

