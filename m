Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D90BF36B1F9
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 12:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=f8i3cnhnMmy72N7+FieUU/AGYsL2lzW1Rplp3YZRWeM=; b=1h8jd9dmBYQDE37Sxjy/IMUTFF
	DnWH9og4tONF/OkstHevjNNMAzEm0yJfWlvXvS3gPXLwKdxfzagHkznJfJrRaiCnkWiAEsLIKxJvR
	1Mmaa0QYWOhW8tMgNhDNr5XBK0vmnP/J2KtjM4mxAh/cC3lokT4ZTILwVbJCNuW0PmN24JGjb+iXp
	O3FG+595cANvmQtvHhG/4hhv8GYGOqlDppndqx3JWCDMx9EXXj2NXF8zE7RlTcnmTxrteukAawvis
	CHFBeUxyROstI/ClT4Cgjd5pacIZcE4XEU8C005VNdzfpffP9k3qC3Uf/rDeFu7zBxnoNgjYGhBVS
	iz27on3Q==;
Received: from ip6-localhost ([::1]:51118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1layu5-00CTKE-GI; Mon, 26 Apr 2021 10:55:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1laytu-00CTK4-F0
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 10:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=f8i3cnhnMmy72N7+FieUU/AGYsL2lzW1Rplp3YZRWeM=; b=JUFEI4+yOfcGm3jzCFdRreicIS
 9JWHEAwWxy+kcGuv6WsUHBVKyN7njNkcWa3Yvq0dkJkNwEdK/60zYq8DvTfXZVICiQ2JHN+tcfrf+
 QzAms9X751W2+BvU7m81m7ukyJDbP5dGI1pxAdMfNLVtk0bYU16YUealAwJ7KeNXvVuSakBtjvlB6
 bbbad4cDmCf/p1UhAN5Exic4e9kA7BQu++ZrAps9Tk8POVogOleV8Gzmpc2ls2mmq/H3H/a4kURN2
 YjXw2HhXWj14jwyrmPCAQI7A0AEiERMGF8udtOFMwKjFqBYqn9kyFr2rhcLC1HyYQZ9TugTxv8+Jh
 GnvtemisMUjBbYkHBsw15d//7Af7THuafZ68PVejYSg7ykCuwq6oGErNyq/E9d193wEdLYrk+H4Rk
 p8WLIlc2bYRa1BFoHzBkNFGsMOEryzUba4TO/r0pNqGnGWYpB1XZ0UtwDGqeIuFWejhthyEVOmqPw
 iLVFJLxE9jLd14QqjkfElPNZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1laytg-0006It-4n
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 10:55:24 +0000
Subject: Re: Ubuntu's ADSys
References: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
 <a9e82907-faef-ade9-910c-6578987c5d72@samba.org>
 <YIaZmO3WleOfenUn@pinega.vda.li>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <7d597dab-55b0-cf11-1823-0d98d8eba96c@samba.org>
Date: Mon, 26 Apr 2021 11:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIaZmO3WleOfenUn@pinega.vda.li>
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

On 26/04/2021 11:44, Alexander Bokovoy wrote:
> On ma, 26 huhti 2021, Rowland penny via samba-technical wrote:
>> On 26/04/2021 11:27, Douglas Bagnall via samba-technical wrote:
>>> I noticed that Ubuntu 21.04 was announced with "native Microsoft Active
>>> Directory integration":
>>>
>>> https://ubuntu.com/blog/ubuntu-21-04-is-here
>>>
>>> It looks like this is based on a project called "ADSys" (GPLv3, written in
>>> Go), that works as a GPO client.
>>>
>>> https://github.com/ubuntu/adsys
>>>
>>> They use Samba in their tests, as far as I can tell.
>>>
>>>
>>> Douglas
>>>
>>>
>> Well, if they did use Samba, which version of Samba ? I ask because I tried
>> 21.04 in a VM against my Samba AD domain and it didn't work. No matter what
>> permutation of username I used, I couldn't log in. I found out that 'getent'
>> didn't return any AD users.
>  From my cursory look over the code, there is an assumption that AD users
> all named fully-qualified, e.g. user@ad.domain. @ is hard-coded in
> multiple places. They seem to test it with SSSD.


 From my understanding it is all supposed to be automatic, you just tick 
a box during the install and, after the install, you can log in with an 
AD user. I tried every permutation of username I could think of: 
'username', 'DOMAIN\username', 'username@dns.domain.tld', etc. Nothing 
worked, so I logged in as the user I created during the install, opened 
a terminal and ran 'getent passwd rowland', this returned nothing, I 
checked in AD and the machines object had been created but with mistakes 
(wrong SPN etc). It looks like it still has problems.

Rowland



