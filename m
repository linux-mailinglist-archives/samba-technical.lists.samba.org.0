Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 331491E8518
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 19:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=J6Ytw2OORQJFHLRFThAmFyUtjF1Z1ZiUbemPp3x8XNY=; b=gtsrqpbSpJp57xnu16ORf+YwRQ
	cNlkTjPZY1Bz85rgC0gFFUqL7v/y/Jts7QzofNYrM393oo4mrqn/Ty4O9lk7+mdFL4SCzYjeRZaU2
	r9wKaoDv42/eNFMZL4vzN2qnlmaVa7qF1U7g/ZzloNEfAfpfiu3BWurkyGsYcgH1jsTIQ0p7Pdk/4
	Uba2+6wTKgR0brIAOmmpZ/mCigzHkFnft7J3mL0Njxsd8C5x62YiTeQAZ5SaomqazmnR0/Y+rR45Q
	8kvKpjFU2hjLja00V4KoMAkQBinrFZYGOclQUzkyKiZNcFjuIj8F66n5VAWBejQu2qR++xHo3q9VE
	t8sk2Xvg==;
Received: from localhost ([::1]:20498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeiwQ-006LiV-E5; Fri, 29 May 2020 17:37:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22636) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeiwK-006LiN-Ow
 for samba-technical@lists.samba.org; Fri, 29 May 2020 17:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=J6Ytw2OORQJFHLRFThAmFyUtjF1Z1ZiUbemPp3x8XNY=; b=f6paxzs8KCsbTgR+3XrE5RuYbD
 uG22JBoDl4+CFs5bx23dHV4nLRwiCiTbp0UPIde0vBOemKgDmZJrUyUQnU4sOWyJMnLX0XbJ0vIrh
 IP2YwENRuUVEj8MztnkjWMGN+7eZuyjN/1oBeQrQwiXpJE9OYDzMA05IbJU6Gm4XIJw03LVVjLeqc
 Crl8ekJSW24dm4xWg90TzUTpV2CDbVYAacNz3LonKTPQ4vAAwapHMw+eT5Mx3F7Z/RG3a/sBWU+Ue
 xVT30cE/tzbJjRtAJUlueJfHoioRAgFt4ZcPG6QfG5j+mrB8zXet5893mkzNyfT7orA5YDKznftsy
 9vSr8RpOJw2YUdBdUJUUllRzYR1lEPj0ytkWM9wHgwTFVIhD+Gm/m1skx40V/hIkQtFivcH0gwfhP
 W98s61yt9Nnsp1nYd4J0nu4S0Wp8sxfML8VtjAmUT8nT8E4CoqLxkxb89Yj1qgnSw72YbOHjNhzYn
 10tcyiLqPbtf9vRHVA7l0r7H;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeiwJ-00006w-Uf
 for samba-technical@lists.samba.org; Fri, 29 May 2020 17:37:04 +0000
Subject: Re: Checking if Samba is running as an AD DC
To: samba-technical@lists.samba.org
References: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
 <20200529062444.GP5779@onega.vda.li>
 <277f0fe0c0f811497189aa279380702cc1228838.camel@samba.org>
 <CAH72RCV1gDMqnKS6zw1XpR9v47hLGyrTVcxL+XDhVSKQLTfgPQ@mail.gmail.com>
Message-ID: <f2bef0b1-762e-40dc-0168-dd50776a2b85@samba.org>
Date: Fri, 29 May 2020 18:37:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAH72RCV1gDMqnKS6zw1XpR9v47hLGyrTVcxL+XDhVSKQLTfgPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/05/2020 18:26, hezekiah maina via samba-technical wrote:
> Thanks. I tried out the different ways you gave.
> I also tried this:
> samba-tool testparm --parameter-name=serverrole
> which seems a little better as you don't have to provide the path to
> smb.conf which could vary with different installations.
> Well you can omit the samba-tool and get the same result with testparm but
> would have to press Enter to get the desired output.
>
> On Fri, May 29, 2020 at 9:33 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
>> On Fri, 2020-05-29 at 09:24 +0300, Alexander Bokovoy via samba-
>> technical wrote:
>>> On to, 28 touko 2020, hezekiah maina via samba-technical wrote:
>>>> Hello everyone,
>>>> How else should I check that Samba is running as an AD DC apart
>>>> from
>>>> looking at the smb.conf file?
>>>> Is there a process that gives me this kind of information?
>>> For Cockpit integration you need to use systemd services to check
>>> whether a service is configured and enabled/started since that
>>> environment will anyway have systemd configured.
>>>
>>> systemctl is-enabled samba
>>> systemctl is-active samba
>>>
>>> For the config file checks, you can use 'testparm' utility:
>>>
>>> $ testparm --show-all-parameters -s|grep 'server role'
>>> server role=P_ENUM,auto|standalone server|standalone|member
>>> server|member|classic primary domain controller|classic backup domain
>>> controller|active directory domain controller|domain controller|dc,
>>>
>>> On non-DC system:
>>> $ testparm --section-name global --parameter-name 'server role' -s
>>> 2>/dev/null
>>> auto
>>>
>>> Checking configuration is needed anyway because you get information
>>> about the actual server role, not just that a service is running.
>> G'Day hezekia,
>>
>> Welcome to the design session for your first bike shed!  ;-)
>>
>> Try (eg):
>> testparm st/ad_dc/etc/smb.conf -s| grep "Server Role"
>>
>> Andrew Bartlett
>> --
>> Andrew Bartlett                       https://samba.org/~abartlet/
>> Authentication Developer, Samba Team  https://samba.org
>> Samba Developer, Catalyst IT
>> https://catalyst.net.nz/services/samba
>>
>>
>>
>>
If you must use testparm (and that will not tell you if 'samba' is 
running), try this 'echo | testparm -s', instant output :D

Rowland



