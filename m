Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F36B62DBE4
	for <lists+samba-technical@lfdr.de>; Thu, 17 Nov 2022 13:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PmVvM63hok24cDInP2LJ2cM3bo85Rc8VT7bbf+CmR5Y=; b=SyEK/EFUUaDEjksBIQ6g+uzp/5
	K7j7IRGWCuhObU4ikwwULQFlN6J/JY4OCveZHMpFPKjstYLu4gpvK9mBErFJkm6s8P3WwF9yeO1LA
	BMuR5/kr9szUoH+oVQN8EC4owYKl/MKVyX/kERqHxppvPJrhtQdnsWDmZFbwTgtdaWUgmA7e8uI+U
	CYKfXyAe74cvVNzwD+qFFTtFKQ/s1qCd2wC9HnSHRYGSuncn595rjL37lfK8N2/r70Xh+iPzQPW8s
	PRbSk275lFpN/7GoAKJE0UNya9B0lIkxoOkWbQKJMILdNCUrtT3OeSLjFaxi90Z3Exw7lt2h6s416
	1erWlfkA==;
Received: from ip6-localhost ([::1]:62028 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oveH2-00EqvH-NU; Thu, 17 Nov 2022 12:45:44 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:59247) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oveGw-00Eqv8-2s
 for samba-technical@lists.samba.org; Thu, 17 Nov 2022 12:45:41 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 357284030A;
 Thu, 17 Nov 2022 15:45:35 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 55B1F131;
 Thu, 17 Nov 2022 15:45:34 +0300 (MSK)
Message-ID: <6e43c434-ff08-0b9a-4c35-3a2e3117f7ac@msgid.tls.msk.ru>
Date: Thu, 17 Nov 2022 15:45:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Can someone please build us a 32-bit Debian container image
 please?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <c2802ea35aa48ada6a638c31ff19b7235845c268.camel@samba.org>
In-Reply-To: <c2802ea35aa48ada6a638c31ff19b7235845c268.camel@samba.org>
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
Cc: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

17.11.2022 04:02, Andrew Bartlett via samba-technical wrote:
> https://github.com/docker-32bit/debian is GPLv3 and small, could
> someone please adapt that into our bootstrap system and buildar and
> have us build a Debian i686 image for our CI?

I know very little about docker, but I do use debian images (and other
system images) quite often, - in particular, to test samba and qemu
(which I happen to maintain too).  I use various images to build samba
for different versions of different systems this way, too.

The procedure outlined in there is trivial, they use debootstrap to
install a base system image into a directory, create a tar archive
out of it and import it to docker. Debootstrap utility is a shell
script which is supposed to run on various unix-like OSes.

Andrew, what is needed, exactly?  I mean, what should this image
contain and how it will be used?

/mjt

