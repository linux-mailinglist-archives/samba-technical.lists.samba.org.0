Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2FD36B296
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 13:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HoW1vAFf9WVKXJiJk9J/HxhMTvyV1SLjv6P5N37M8Zg=; b=dR2agYQRGPUQ2V4Ox7qBituTD1
	hwSE63cpyJjKP/YztcS0R9SIagiVQSO5cn/SpOhUghnZyA22/P+yn0Rkh0N5mAdwLHoPS30Ck0OSP
	DHBAiWsXjSatAMOMBtUBLA6qxb6OCnKBslVaH8bim4reBV9fGrh/tQDBgVwrebPMZAUE8FiOpAyWO
	a4Is0VvvO05gSruubyF8IL6cpRnwVFUjJpQlQKLBcN4nF8Dt5CnnF4dqiBhteYNfFmz/h9x8i+wvm
	d7dAMQbnmCMXCd69U5et9gsEBVpMJ3cr3eoCVvyiKCWLgIRMrTBPaX9o5UCNaAIeL9f2U35OmhYBI
	fytWv6cg==;
Received: from ip6-localhost ([::1]:52574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lazqh-00CTcj-36; Mon, 26 Apr 2021 11:56:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lazqY-00CTcb-TL
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 11:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=HoW1vAFf9WVKXJiJk9J/HxhMTvyV1SLjv6P5N37M8Zg=; b=Ne4Am56V0blMVwLNHQxfGFh0Si
 Wej1tZgC2xhZozMJRj/oQ+LLVCSlUlKZKrjbhUeMz/tej17divV2k1PGC+Im5iTqf6pZkLHk8q8Ao
 UbZ4tR0KeLlfS3/RnR/Hxr0NNvDtobNuSf8RzRSNi1iG47jqIekxaAs2ttXJ8B9b4zFUT8uHnGEA2
 KxpsKOcapD5723vA6mRJU8ixEjzppplUmD4Ajmw7DkmVpjdV8ELEUHk91OfqoLg9NYNJJJlBQhYjB
 njMf9B9LCpxr6xWY8sRL9YXe7CnnathuY7BBVXNZrWaK7yg3d84YCBVzsNeQs+zWcchz9giA1f+VI
 eD2VLbtj6ZuVAFs0utE5U+aeGdni7X2p3Ono4N4FrjCrhmQ5hdwr/HC1F4R7jdpu58Bw3nlOB3f/p
 6qri5rdBvNuKE43Ap+ayXciLPzgNSUDj1lcOHoBDK7YFelTQtgX61XnnGTHw83CZljjyE1u7vghO6
 vGpPceGzQ3qxINcAQk7D8mmz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lazqL-0006le-IH
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 11:56:01 +0000
Subject: Re: vfs_snapper is enabled but prerequisite dbus-1 package not found.
To: samba-technical@lists.samba.org
References: <1398593433.332041.1619436765261.ref@mail.yahoo.com>
 <1398593433.332041.1619436765261@mail.yahoo.com>
Message-ID: <6b1fcffd-ea8a-7ffe-62eb-46e493adcfd4@samba.org>
Date: Mon, 26 Apr 2021 12:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1398593433.332041.1619436765261@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 26/04/2021 12:32, Jason Long via samba-technical wrote:
> Hello,
> I want to install the last version of Samba as a DC on Fedora Server. I did "./configure" and got below error:
>
> vfs_snapper is enabled but prerequisite dbus-1 package not found. Use --with-shared-modules='!vfs_snapper' to disable vfs_snapper support.
>
> I checked the dbus package and it installed already:
>
> # yum install dbus
> Last metadata expiration check: 0:12:35 ago on Mon 26 Apr 2021 03:43:20 PM +0430.
> Package dbus-1:1.12.20-2.fc33.x86_64 is already installed.
> Dependencies resolved.
> Nothing to do.
> Complete!
>
> How to solve this error?
>
> Thank you.
>

You need to install the devel package: dbus-devel

See here for a full list of required packages: 
https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba

Rowland



