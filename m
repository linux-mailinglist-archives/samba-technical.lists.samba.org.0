Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A4846C46
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 10:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=wHJ0ZbfgWEHJkmk/qXr9UNf442Dbd6DzpxutUc/KgHU=; b=0OKIMdzb+vKSHmw4zF0YRTYIqK
	yXUBhFAIxogZ9K7EmmS3w69L6W0Z1qbKHT+hnYARdsGQapB8++U3P0DqxpZJcv6ZWxTX4ccRPuQlf
	1AEYdoV/l31qyKk/ybN62L3Dn/NpRChSdbP1c6h6Ry/P0pAA9g7jjDKPkikgufSTenOT0hbJO95Jz
	R/bHgsgWHzXkkdzqkow19KXNRJei9Z+rNqvcNJjFOcxevxpD08ahhCJoUhquE0yfiqe9z/7Yg4jZf
	dhBjES27TxVm1Ep3ZM8JFdRG44rWAuKBt81/hRa7fldWvoCyfBAHD8ZevD0z8YGjYGN/2RhNNrJfv
	0n0zdfiQ==;
Received: from ip6-localhost ([::1]:29352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVq0o-007LLN-CZ; Fri, 02 Feb 2024 09:39:06 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:59666) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVq0k-007LLG-3S
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 09:39:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a363961b96aso248139666b.3
 for <samba-technical@lists.samba.org>; Fri, 02 Feb 2024 01:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706866741; x=1707471541; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wHJ0ZbfgWEHJkmk/qXr9UNf442Dbd6DzpxutUc/KgHU=;
 b=LGTi1NitRZ8xpvAIR1YOHAIr3lZ7quIVzLJ6rxv8sbv15D2rAPht8HFrePNGfSVSLu
 IJhdOvzD/bqk+LeIbKDH51b2AI8OEY4cHbJK3pBVWVZ7Z8LyMV/YiYNnhcHNTJnbF13Z
 tC7dXhkp9hzYl6YbLvqfHDTmHhTjjYzXJ6XGMZWu5H8Ahvk0ir/7GVl6gB01FuDk4b1p
 qrk1cQerD3jNy0FttbgjYct2HXz8Niu9ESzzqEn4GUSSj1kAbHdnngkMWAaTPGnrte3b
 /qePWHxqp9UQcNv/1FyP5wrCmDNUBIqnro8Pe/+TPRnAyTpU4eDOctXYEkhAN7RbJj+w
 jPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706866741; x=1707471541;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wHJ0ZbfgWEHJkmk/qXr9UNf442Dbd6DzpxutUc/KgHU=;
 b=Bcl+2W7E4XwrRSGYOYtGokS4jCPdO0OzT1+IyKe6DOiBJWOj3QPBRJ14X3q0oEgFHW
 JMuG3UuBH4aDHJ4SJpLMAPy8bFRPrVJT1bBjSDpkadxRDoLUMYtvU84iXQMB3XIdV3ev
 po/xUORYahALqY50qm3xVxJj2jFMRgXGEFD6EuX0xqyNYUJFNcaaEdA6jw6sh34Qqdrc
 Eg3XXWwzXrVFb9pwgxI/cufKihPyZ/g7kBF+jmXBRCrWkvCRT9Fx4au8dAt/VObacElU
 Y5LlPxtfNtqkqhYW3kINIeekqY1JHI5ZBV9GV8mQv+4ZoXoA3rVI6ZMPLgDCk2Pz2HcB
 b7GQ==
X-Gm-Message-State: AOJu0Yz7WX1KeJXdEKa2O+aK6TQzT6OEr/7vE3QihR4hN/xktN+E1vPd
 yNTAyWgt7H4DITCo+8N8LMMobwIEkGk4Lzz6jbrdoqcAplp70pfuE8vhUodO
X-Google-Smtp-Source: AGHT+IEOAl0MSx8DQ2+o3GbRMHby4/QjXM56tJEbpErcm3pO9+e4fnsOmql41/gRK44uDC5qC1JBMw==
X-Received: by 2002:a17:906:b88e:b0:a36:5c43:1812 with SMTP id
 hb14-20020a170906b88e00b00a365c431812mr5845004ejb.22.1706866740918; 
 Fri, 02 Feb 2024 01:39:00 -0800 (PST)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 a27-20020a170906191b00b00a35df307713sm692390eje.161.2024.02.02.01.39.00
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 01:39:00 -0800 (PST)
Message-ID: <18a76118-bc8e-4e23-b0b9-b22101958d14@gmail.com>
Date: Fri, 2 Feb 2024 10:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
To: samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
 <59c38ffb-9ab3-44ef-9c56-2ff12078fd1b@kania-online.de>
Content-Language: nl
In-Reply-To: <59c38ffb-9ab3-44ef-9c56-2ff12078fd1b@kania-online.de>
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
From: Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kees van Vloten <keesvanvloten@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 02-02-2024 09:44, Stefan Kania via samba-technical wrote:
> Hi Kees,
>
> I will take a look at it, maybe I can get some input from it :-). My 
> problem is not to set an attribute an a conjob to find users and 
> remove them from a group. That's something I managed already I added a 
> new attribute to cn=user put the time in unix-format + 3600  in this 
> attribute and check with a conjob every 5 minutes. If time expires I 
> remove the user from the group. BUT the DCs are located in different 
> timezone, that's the point where it geting tricky :-)
Why don't you use LDAP time?

That is the same everywhere (and more logical to use in an ldap 
attribute) and it's not too hard to convert it to unix-time:

unix_timestamp=($ldap_timestamp/10000000)-11644473600

- Kees.

> Stefan
>
> Am 01.02.24 um 22:16 schrieb Kees van Vloten via samba-technical:
>>
>> I have created a kind similar implementation called auto-lock, where 
>> (admin-)users that member of the "autolock" group automatically get 
>> disabled at midnight every day 
>> (https://github.com/kvvloten/samba_integrations/tree/main/domain_controller/manage_scripts#disable-special-users-daily)
>

