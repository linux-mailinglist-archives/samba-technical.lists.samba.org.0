Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C38999994
	for <lists+samba-technical@lfdr.de>; Fri, 11 Oct 2024 03:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AId0vP/t5v2BBwPQyCv00Wm751RPiLPoI1PLUBn6wnQ=; b=Da5mi/HpusDL0cznklu3n2HxI3
	j4BjrrG5C9ZisO8O+VdLZnIxels8WVXpM6/XemOMEFdL05ayEUGpBKUP5IQZGUrNFCHoFvsiyNe/p
	lQpEDF3DwrO4DLi3NKZMstJfnqk5zEkTZeNNSarT7sJnvupDXz4ps2W7S9/O/Qx7qRUJIc0hy4piq
	6UXeotqjlN3xCAUCudMV4HDw/XixF4Tydu/GUMVZqMdH4cZfokPnInzfEF3q7+clS9c95Ixv6xzOF
	8G0Is9Uipb9TIsgGcQ3Bp+ZjuZpPwv72TvtKdkqBqMihV22/acbtWLoutPTxKCKcy2t3yZ530zV/1
	4hAd667Q==;
Received: from ip6-localhost ([::1]:43636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sz4aD-003X9B-3l; Fri, 11 Oct 2024 01:36:45 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:39944) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sz4a7-003X93-1s
 for samba-technical@lists.samba.org; Fri, 11 Oct 2024 01:36:42 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id 5D18CA0;
 Fri, 11 Oct 2024 14:36:32 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1728610592;
 bh=3VjAudKGqwFuHHMZMJG2z36ZO6mkxoX20U3z+7JcaQM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ieOGiYQ+Eo9ezvOTrtuNmf5h6x5m4xdgcTvODLZZ9nJRDJg1RzhFhiwzyhfljVGVI
 MjPvHek0RQbyaOsajH/f/hyGINReJrsGTrv5ZLvL4mJGgN6tdu3GThhRPdouGw4A1Z
 DNCwEJTHPtezUrHe1R74/sTEYaVSjAuqjUsXJRTZupxDylJwvdAwvIhoFHDbY7coGf
 vPOzNPQGNuwzww9RlXerJN5GiLW7jJbogfSXGsenCHdGPo4RYsV+AS6Fs/6Vk0ImjA
 79pTrWPYXYYfTDIrY0VoC1+eZAyO6tYKgdp1ym+REpkzvh7qy9PTdhxwybL+sbZtEp
 JiEl+8HkDEsmQ==
Message-ID: <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
Date: Fri, 11 Oct 2024 14:36:31 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
Content-Language: en-US
In-Reply-To: <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/10/24 10:21, Douglas Bagnall via samba-technical wrote:
> hi Stefan,
> 
> On 11/10/24 05:11, Stefan Kania via samba-technical wrote:
>> I'm just testing how it's going on with the auth-policies in 4.21 and 
>> I see now it's possible to set conditions with:
>> user-allowed-to-authenticate-to
>> ...
>>
>> When I set a condition I see:
>> "msDS-ComputerAllowedToAuthenticateTo": "O:SYG:SYD:(XA;OICI;CR;;;WD; 
>> (@USER.ad://ext/AuthenticationSilo == \"win11-computer\"))",
>> I can allow the users from the silo to authenticate
>> But in the Windows-world it's possible to disallow the authentication, 
>> then it looks like this:
>> "msDS-ComputerAllowedToAuthenticateTo": "O:SYG:SYD:(XA;OICI;CR;;;WD; 
>> (@USER.ad://ext/AuthenticationSilo != \"win11-computer\"))",
>>
>>
>> Am I missing something or is it not yet possible?

OK, now I see that maybe we are talking about different things.

When you say "possible", you mean "possible using samba-tool or something".

I was thinking more along the lines of "will it work if it gets in this 
state?".

In that case, I think you are looking for something like this:

     samba-tool domain auth policy modify  \
             --name foo  \
            --user-allowed-to-authenticate-to="O:SYG:SYD:..."

The other way is a shortcut to allow the most common thing.

Douglas


