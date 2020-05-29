Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CF1E761B
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 08:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ilq4NHWHfVju7seUzwnJZmGAmiyJdKrT0P1AP2jk1kw=; b=Fzvz9TRLcEcYixXYuQ+3YXY/9N
	h4GG2UxSLcY6wHCaFl8sz4wGU+t8ec1xxowUfJpQ5iYn1b85qydOzXsYA1X6vdjoyFFmh4hxOvyWO
	NRzqEt7TdcfVo9jLV90bPER1a9EAENHNq+VgtDNQv58f4YAro3HpKIghxHiurkOwfPouPS7HGgxkY
	xjTsV6n+vR4R/OrPtNoNBlmHWbcGeB6MqLUJ8WgKuq0J/A51l6GBVq/3xmj9GMS5dz4Tfocg/juEx
	+xNV3+K5ysI4gZ6RoDPmHuw+jw4gUM2A+KYEcIYRuKHdAbbz1vuqbSs3RPmKQrezKmF0XCybgruUE
	21JnfHtA==;
Received: from localhost ([::1]:57118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeYku-006JV1-QX; Fri, 29 May 2020 06:44:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64560) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeYki-006JTg-GQ
 for samba-technical@lists.samba.org; Fri, 29 May 2020 06:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ilq4NHWHfVju7seUzwnJZmGAmiyJdKrT0P1AP2jk1kw=; b=W4W43S+sSxi/atlpX0zDmskxue
 T2ysDzyjEYfBJDR73Ckb2xeq57UmEY40MLmh8NY/Zm61ctenM5G1fb3Xh7aSfeq/aNMWQENzCWi5B
 8sUr1SSNgVdXkaelkwNRDbV40OxaBfAQxp8CixRFgzp4qWzLXp68+y62Eo61Ye9BNhQaFMX/3zAtF
 YSXROTgrV3rDIzhaIS/8XcA0K+5x2jKg+ONNxt7WuUbzjQNP7QQlJtk04T5S8C+LVDatN52jeYpOZ
 sXr81OhF9UBlueJTTkN2sQeQw/2IbfXfIE/FEMwi3mEO2EYY2wCuFqPJ6k8eW+rsQXMxFLmhilg0T
 2e+ZnYOTQyHhRySpHVMd3RA7HdwYfyiL5wIi99a2jzYGPfxAxx4YFwniKBWhe5xgnezOEQQfa7a/E
 qafBEJfPIIAljdmsJb972pePLnxpIh3BbojJJ5v/p/Y3PHPWxCwoZvNR9M46LT1ZMn9eZiLNDn5EQ
 LHpTVwEzDw1eRQ/afJLxyf+6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeYkd-0003j7-Of
 for samba-technical@lists.samba.org; Fri, 29 May 2020 06:44:20 +0000
Subject: Re: Checking if Samba is running as an AD DC
To: samba-technical@lists.samba.org
References: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
 <20200529062444.GP5779@onega.vda.li>
 <277f0fe0c0f811497189aa279380702cc1228838.camel@samba.org>
Message-ID: <4d67add4-096f-bf09-22a3-c92793e2a957@samba.org>
Date: Fri, 29 May 2020 07:44:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <277f0fe0c0f811497189aa279380702cc1228838.camel@samba.org>
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

On 29/05/2020 07:33, Andrew Bartlett via samba-technical wrote:
> On Fri, 2020-05-29 at 09:24 +0300, Alexander Bokovoy via samba-
> technical wrote:
>> On to, 28 touko 2020, hezekiah maina via samba-technical wrote:
>>> Hello everyone,
>>> How else should I check that Samba is running as an AD DC apart
>>> from
>>> looking at the smb.conf file?
>>> Is there a process that gives me this kind of information?
>> For Cockpit integration you need to use systemd services to check
>> whether a service is configured and enabled/started since that
>> environment will anyway have systemd configured.
>>
>> systemctl is-enabled samba
>> systemctl is-active samba
>>
>> For the config file checks, you can use 'testparm' utility:
>>
>> $ testparm --show-all-parameters -s|grep 'server role'
>> server role=P_ENUM,auto|standalone server|standalone|member
>> server|member|classic primary domain controller|classic backup domain
>> controller|active directory domain controller|domain controller|dc,
>>
>> On non-DC system:
>> $ testparm --section-name global --parameter-name 'server role' -s
>> 2>/dev/null
>> auto
>>
>> Checking configuration is needed anyway because you get information
>> about the actual server role, not just that a service is running.
> G'Day hezekia,
>
> Welcome to the design session for your first bike shed!  ;-)
>
> Try (eg):
> testparm st/ad_dc/etc/smb.conf -s| grep "Server Role"
>
> Andrew Bartlett

Hang on, Hezekia said 'How else should I check that Samba is running as 
an AD DC apart from looking at the smb.conf file?'

Using testparm is looking at the smb.conf and doesn't actually mean that 
Samba is running.

Rowland



