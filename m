Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FEE799FA2
	for <lists+samba-technical@lfdr.de>; Sun, 10 Sep 2023 22:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rLo+3FX00ZS57Ae8PohZ24pGCmXuxFTtMJzgTlaJbmE=; b=bZWwk/M+i1+YPnpSUxOfrQUc/5
	svyhcToEIpbGqAD0P9zp3dzya8SkeyEvdOq9wd7/qnmX47erZpmUgFB1wD4swUJpHjtfToalxEfG4
	9YpENtNf2aOj3IUE+aSJa3MkDthRtVdLPC/gvJ7oV2B3lWIxiXX/xKxB8Dp8Aa7y3n6HR2y4pwvbE
	Jz3DA7l1LYmwPHKvnVco+fRUYpJxsOOAPOm0urQ+sa+M3o3giTCYDxKfDQww+jiRfTBv2wP838FAm
	wc3cqI/EEa8Qvpaj4t56S+5yPegyBjyhxLdPEuBMvbKyBVM9wnhHjCPpCo3YyVOYn2vE315iBLpTH
	jePX/1bA==;
Received: from ip6-localhost ([::1]:41018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qfQnP-002jaq-TQ; Sun, 10 Sep 2023 20:12:39 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:46829) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qfQnI-002jah-VP
 for samba-technical@lists.samba.org; Sun, 10 Sep 2023 20:12:37 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5E67F20928;
 Sun, 10 Sep 2023 23:12:29 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id A97F2270B8;
 Sun, 10 Sep 2023 23:12:28 +0300 (MSK)
Message-ID: <834e6dc0-1efb-958b-5a64-d27fc62e6e28@tls.msk.ru>
Date: Sun, 10 Sep 2023 23:12:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: two kerberos impls are used by samba now
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <41985a01-8374-8f1a-5762-ededced82831@tls.msk.ru>
 <fc386fdb62da5e1ff9f42b3a0d346a2dcdd1756d.camel@samba.org>
In-Reply-To: <fc386fdb62da5e1ff9f42b3a0d346a2dcdd1756d.camel@samba.org>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

10.09.2023 22:48, Andrew Bartlett wrpte:
> On Fri, 2023-09-08 at 22:04 +0300, Michael Tokarev via samba-technical wrote:
>> FWIW.
>>
>> Just noticed that all samba executables on debian (built with
>> internal heimdal) are linked with *two* sets of kerberos libs.
>>
>> This is due to libtirpc, which is a replacement for the former
>> in-glibc RPC code, which uses libgssapi-krb5.
>>
>> This should not be specific to debian but rather specific to
>> glibc.
>>
>> Wonder how common symbols from two krb5 don't clash...
> 
> This is related to your other post, due to the symbol versions, as I understand it :-)

Unfortunately it is not.  Only symbols from public libraries with
stable ABI are versioned in samba.  Symbols in private libraries,
including internal copy of heimdal, are not versioned.  This is
why we had named crashing due to some dns function name clash.

And two krb5 implementations are using quite a lot of common symbols.
It looks like no one come across a good crash yet because tirpc is
rarely used with nfs + kerberos together with samba.  I guess once
someone will try to use it with krb5+nfs, it will crash left and
right.

/mjt

