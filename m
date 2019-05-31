Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB62231537
	for <lists+samba-technical@lfdr.de>; Fri, 31 May 2019 21:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gPkTXAi8CzN1umPjgBjewoRRhD+5e4Y/3cC6zs9MJD0=; b=Qy6xiw/Cn9A0uzwi7t6/7JYX7l
	aXnfmMuwt4S7cOAfXM6MNQscKCTK7zA4Y/hWb8fye7P9+TrwvPMDwYOEVGMV/WTFG6kx0E/rdbwcS
	J51SMCXfvqdkXEBBSky/foIvk9ry8EtsSC7fcRChlqUuJv8MrNMD6diHF04e/xcMd5qS8R1I1C4GZ
	LBDMvhF4l5i/n7jehm47E+HG0hOOAF2b3HWZB+y2zWZMdZrGyLGUwK0J32SD5wOsG+8fr3ygBIo+Z
	VoOxe/Oku6Gh9dGIxNEB5h4uNAT5EzJGPLDZBtevWBFmmYW6OOKa2pBpJYFxyrDQNthaSGm/y6WKI
	xy4ZLF6g==;
Received: from localhost ([::1]:58252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWn79-002pVB-52; Fri, 31 May 2019 19:22:55 +0000
Received: from [2a01:4f8:192:486::147:1] (port=23360 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWn75-002pV4-4i
 for samba-technical@lists.samba.org; Fri, 31 May 2019 19:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=gPkTXAi8CzN1umPjgBjewoRRhD+5e4Y/3cC6zs9MJD0=; b=N17FTqA+56nlFdu4LqcOdgXo8f
 LIsZ/0e6x4sU3mnLYjpTPhDP1zRV2rPc7IVgYxHDYBY6L30ac2lboXucmJdyNf2/ZrZIDUc/yHs/b
 8TkkJGmTlsYoC9RG1asJYzU5isGEFDu3jaaLtdBCSd96hF85u/RCMmvTfwPG5tQt85Vk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hWn6z-0000bu-BL; Fri, 31 May 2019 19:22:45 +0000
Date: Fri, 31 May 2019 21:22:43 +0200
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: [PATCH] Fix compile error with --enable-selftest
Message-ID: <20190531192242.72mvymaagfsiw3f7@inti>
References: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
 <20190529075805.zc4qabjyb7plsajg@inti>
 <20190529082426.GD4871@onega.vda.li>
 <20190529084444.gcd6k2kgskv4jnhz@inti>
 <d59909ca37f6b2abeb5fc653f518b41da30b0680.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <d59909ca37f6b2abeb5fc653f518b41da30b0680.camel@cryptolab.net>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 31, 2019 at 11:04:09PM +0530, Anoop C S wrote:
>On Wed, 2019-05-29 at 10:44 +0200, Ralph Boehme via samba-technical
>wrote:
>> On Wed, May 29, 2019 at 11:24:26AM +0300, Alexander Bokovoy wrote:
>> > See my separate email -- there is a typo in the commit message
>> > (undecalred). With that fixed, RB+, please push.
>>
>> fixed and pushed. Thanks!
>
>Sorry to ping again. I don't see the patch available in master yet. Is
>there anything pending to get it pushed?

the autobuild failed once, iirc I had restarted it, looks like something went 
wrong once again. Pushed once more...

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

