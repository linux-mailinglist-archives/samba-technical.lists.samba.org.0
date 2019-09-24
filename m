Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9590BD276
	for <lists+samba-technical@lfdr.de>; Tue, 24 Sep 2019 21:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=jpx/VLwcrl65eqaWD0Zh/Zsi5oLrIkN59OK3DxpLqkQ=; b=Mf3l7aAVRCV8gYfLeG+T/y/YGG
	x6pxfag5Hnp5GLnm1QKoyFT+xbEBoQLR2ljjzVNxtqKfVfmMJOyZdJj06KFuZLi8VqVSbyazUNtXJ
	xx9BxcGbT1s4DYrr/J7bQU3jLNCXRXUNHWVRKEzV6a2pDhntmBlDPbJMDgoI9og8q4cAvg+e0Ig+z
	9EMm3a03nVnNrhLjpphVahNRT5pL65G3TGlJb/jO4msKDanzU18eoNLpt1ORLhjLubZoHy3Z9s9+S
	y2mpRoKlnXsacidE4SZucQI6E6S5fC9IXsTMV0PHzKk7BG4AXDGgsezuQ8Lf1nJcRj2ffvZoOWr1q
	eG2C5FWg==;
Received: from localhost ([::1]:33938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCqFp-008JR3-3f; Tue, 24 Sep 2019 19:13:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCqFl-008JQr-7x
 for samba-technical@lists.samba.org; Tue, 24 Sep 2019 19:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=jpx/VLwcrl65eqaWD0Zh/Zsi5oLrIkN59OK3DxpLqkQ=; b=S2AgV10bWB7FE7whC4L93JyRmn
 C0qYhtfEcKTxrQ8ZZIKqDkvm/pdpH5GCFSrO43Md4aiAg7HxmS0MWU27XF6Nq4XXwPpBB3iOErkDk
 t/vA8Tw1JEmcjct2vlb/D/P/5EndT1iTdrNHKxXjjSLyxeuUWr6JbvWuba77qxPBT/DI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCqFk-0003uA-GY; Tue, 24 Sep 2019 19:13:36 +0000
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
 <21a27887-ef4f-2c51-f511-e682f1548a22@samba.org>
 <c5741e7a-74df-b2d4-479a-8d555c0bf0e2@samba.org>
Message-ID: <4c60890f-2caf-5867-b0f1-e4f5aac954a6@samba.org>
Date: Tue, 24 Sep 2019 20:13:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c5741e7a-74df-b2d4-479a-8d555c0bf0e2@samba.org>
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

On 24/09/2019 20:02, Stefan Metzmacher wrote:
> Hi Rowland,
>
>> Well, it doesn't do that on an actual Unix domain member using the
>> winbind rid backend, but then, from my understanding, idmap.ldb is only
>> read on a DC, or am I missing something ?
> idmap_rid uses ID_TYPE_BOTH as well as idmap_autorid.
> And it should work on a member server just fine and it's a bug that it
> doesn't.
>
> metze
>
Then it is a bug, because it doesn't work on a Unix domain member using 
the 'rid' backend.

How is this supposed to work on anything but a DC ?

As far as I am aware, 'ID_TYPE_BOTH' only exists in idmap.ldb on DC.

Rowland



