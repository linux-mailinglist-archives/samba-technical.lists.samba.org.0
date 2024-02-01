Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6084628A
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 22:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=FPdRAP3GUc1TmW67KS6/aJQ0BodvdKkyb4JvTPYa/vo=; b=2o5+/R/joEmZiNhsF9BDbKGhWQ
	YSeAWZhaQgnrpJqlkNiWFGHF3J7eA7+frA5VjrKilh8Ia3tnJXqqoBG5WThgrMP2Isej2SSsEG/4A
	TYZOE8ccHy83eh3MRRBOM01+aoRgCdP8Le/Xsp/fbGx7m5ftafLyU7EjVjkI4WhCfRyhKTxCk356z
	AageWta0Vki/50uSWT64rONEI4bbpVSpKGN2Q1ggSQzsXM8Kil7WoH2eJxiHHEVD88q0QAcaIUj/k
	VpGjpsD1ES6Ga+4+31UnRFmVNKgGcGeESwqzTztamb8PlZY2VjIlVmdUHixXA9D6PvEfJTr7ip6vF
	991Fis+w==;
Received: from ip6-localhost ([::1]:36254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVeQO-007J8z-3L; Thu, 01 Feb 2024 21:16:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:50249) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVeQI-007J8q-Sl
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 21:16:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a350bfcc621so170890066b.0
 for <samba-technical@lists.samba.org>; Thu, 01 Feb 2024 13:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706822196; x=1707426996; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FPdRAP3GUc1TmW67KS6/aJQ0BodvdKkyb4JvTPYa/vo=;
 b=kvAXC+uJEcQySf5uKDKenPPCnWs4Eexq9rPXD0PILHeVPVCRyT/1ogayZUvXq5w7nS
 995jPI0m3CWlrwhscLEAPZnKDEKHwesJb5zIyJ1Bhn6nQzSwaNXaDhlBOH8+IuuNEMpY
 zVojZ9JtqM/qPIoNmSnnpe36dyE7r6RqT1hfZq+uR0ZaA5MdaTGGP2PoydJzvDbkw6Ym
 GNmT3XeOa7IMZF1EVRqL6foK6rI7KhQQ0a3vAhNh0Bu3iVMuFvMId4xo1LdNHG3WDOZu
 oE5gKBits+iJi6nvG1XG70jzH/50qcpGqzcAz+agRM8pUumVEliD+M4ZEbf/nQZlfeDh
 Be6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706822196; x=1707426996;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FPdRAP3GUc1TmW67KS6/aJQ0BodvdKkyb4JvTPYa/vo=;
 b=aa22JAHT8a3diOabGYGDwFMHJfYoTZurIElzvWkdduDRcFE4i7QlXmVhI3So/Wc0qP
 azMPeLSwB5hxJCu2Osph6jM4jaLl2WKX7mVy4A3b+MofrAaVCg4vZ6UNATfh3jrQh3nR
 KCXA5VkHV0nTDhkrq3mHu1RoA1pmhM6pArZG4JkFMenGOawyvhdK7v1XAIhtKXHYNC2Q
 B1XTL86Vi9xIUy+sZu9Q+jJtG3llZ9YvAkG5Y3olZraMhGFqe4xJc8dSZcWqKDAhwBwY
 F2RL082a/ZHpmRz0oDjCU3JvDQ9qt8lbItbm+tavANfcQfi54puJ/YVkNjHE3tGfv6rl
 Vghg==
X-Gm-Message-State: AOJu0YzNU0Dwk1VvDXp6jhd1kgFRIJXKJinwn9TGXeqP0meOnIgpgLjr
 eBQHWCgN+rmYXAm4gcjo0EEzJ9ndloGgerFcRHjVNSYVsAlN8Oa+R7BGOF70
X-Google-Smtp-Source: AGHT+IHOnKqvtldP5XtOMtNCHT/SJLtBI9781VHQSXyQmWYKO4CigqlrDtx+bPEXQnvT3lkcz82NKw==
X-Received: by 2002:a17:906:9b55:b0:a35:d914:c33e with SMTP id
 ep21-20020a1709069b5500b00a35d914c33emr182663ejc.52.1706822196014; 
 Thu, 01 Feb 2024 13:16:36 -0800 (PST)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b00a3604597618sm166140ejc.178.2024.02.01.13.16.35
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 13:16:35 -0800 (PST)
Message-ID: <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
Date: Thu, 1 Feb 2024 22:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
Content-Language: nl, en-US
To: samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
In-Reply-To: <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
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


On 01-02-2024 21:38, Douglas Bagnall via samba-technical wrote:
> On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
>> Hi to all,
>>
>> I already posted the question in the samba-mailinlist but I think 
>> it's more a question for developers :-)
>>
>> I have a question about FL 2016 and if samba supports it. If yes, how 
>> can I use it without powershell.
>>
>> In FL 2016 there is the possibility to put a user into a group and 
>> the membership is time based. So I could put the user Foo into the 
>> group 'domain admins' for 30 minutes and after 30 minutes the system 
>> will remove user foo from the group.
>
> That sounds good. We don't do that, and we don't call it part of 
> "functional level 2016".
>
> The things that count as "functional level" are listed here:
>
> https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels 
>
>
> They are protocol level things -- supporting FL2016 means you can 
> properly be a DC in an FL2016 domain.
>
> Temporary memberships is a useful trick that Windows Server 2016 can 
> do, for which FL2016 is necessary, but not sufficient.
>
> That's my understanding, at least.
>
> Douglas
>
>
Still, if you know what this powershell call changes in the LDAP record 
of the group, the user or elsewhere in LDAP, you can mimic this 
functionality quite easily with a little cron script on the DC.

I have created a kind similar implementation called auto-lock, where 
(admin-)users that member of the "autolock" group automatically get 
disabled at midnight every day 
(https://github.com/kvvloten/samba_integrations/tree/main/domain_controller/manage_scripts#disable-special-users-daily)

And another piece of cron-scripting makes "password expired" LDAP 
searchable (which is not the case with the computed attribute 
"msDS-User-Account-Control-Computed"). With this applications like 
Privacyidea can disallow MFA for users with an expired domain password.

It can't be hard to query some attribute and add or remove a user from a 
group.

- Kees.


