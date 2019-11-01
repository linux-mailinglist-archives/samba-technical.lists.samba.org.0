Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB4EBF3A
	for <lists+samba-technical@lfdr.de>; Fri,  1 Nov 2019 09:33:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=2AcQ2XuQVS5MCCzCmTNXWold/xy1cUqOleDkDx/nhlY=; b=tsBoyGF6MeIFdmTEpeyFeTQiMc
	F+j3DiuB+QLphBTni0Gx+JF5D16jJotHloc/TVFF7jNfLjtDiZADlw9/TXdO4zYNPkvZNjIKsSnJc
	r9/U9RWwImfLOuVvjGC/Xxeo7nR5Hz2zucqSqoIY5mEpoYs91mDsFrP5m8KxmTYA2ho0GjFRmreji
	dIPJxaiGMtY1MyxKCeYp2XUWcitTwLP/s0er8EoY25hCbixmOTBp7d9a3XpF1Bkm4iMftcw2Two4N
	7jQfPrMMA75A3fZk74OkFIAtGKfCXiwt3D3Sz0+yqPYYXR+ca5+bo18zrq87vL53OyNBztXfchZBY
	XWAZbh0w==;
Received: from localhost ([::1]:65384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iQSN9-005qlu-91; Fri, 01 Nov 2019 08:33:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQSN3-005qlT-94; Fri, 01 Nov 2019 08:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=2AcQ2XuQVS5MCCzCmTNXWold/xy1cUqOleDkDx/nhlY=; b=JRtVzkUTwU6evbb50X6SMSrlda
 Rz1QqOsWRBj1ITd1o7sz21mr9U3BZPB4hi/X+Ffhl0FQRZ3sU+1o86AlSBJ4iOvzW/LmgGnv+UQg5
 8uVaDPF9VPjoHCXto+g7NraiNJaQ9zrufUYgi7N2f1R7sfiyGc2bWv1obGuOecphnyOS3YzClE1YL
 mALncLPmfeAfy80j2CJPLIVArHE69ZPW0ZQ+LmM4J8Hpp94/m3POX3jUo2TV6LgqN4G2taMFmJ4Jl
 MXJDl54aOEFDhNtcvZBOIViny98vYnrSTt6597uZbV0yI6vJsSbXQHIGZr8VftDGAzV8XUguFCZJh
 ZxJApQyH1Pv3fIve7zb0390sdYWNeetrnOMgqyNhsEwAkkLqjqsUBVhYK81d382DJz69idhp0YoA1
 bswfnGNd3KxKyvN9dlzE8jxUwAhRRC+sQb/jEbfLQYHm7tC2wr+Iv1EQJCXimzGuevnf5nC1MEUXK
 BgDze7L22mBN2H+TvN6GGVp6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQSN2-0000Y7-Qi; Fri, 01 Nov 2019 08:33:24 +0000
Subject: Re: suddenly change: idmap uid + gid
To: samba-technical@lists.samba.org
References: <fcf6d6e4b21081a4a05b50c419a4facc@c-toph.de>
Message-ID: <5277c8d1-354a-50dd-29dc-bbe79b5edbdf@samba.org>
Date: Fri, 1 Nov 2019 08:33:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fcf6d6e4b21081a4a05b50c419a4facc@c-toph.de>
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
Cc: sambalist <samba@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 01/11/2019 06:38, Hilberg via samba-technical wrote:
> Hi
>
> The server suddenly changed the uid + gid. this happened to times, 
> yesterday and the week after.
> The samba is a AD member where we have many users (>20 000) and we use 
> autorid in that way
> [global]
>     security = ads
>     workgroup = CUSTOMER
>     realm = CUSTOMER.COM
>         winbind use default domain = yes
>         winbind enum users = yes
>         winbind enum group = yes
>        idmap config * : backend = autorid
>     idmap config * : range = 1000000-8999999999
>
> At the moment I have two questions:
> Why this happened and is there a way to stop the disaster?
> Is there a quick way to repair the disaster? I infects the profile 
> directory used with acl.
>
Sorry, but more info is required.

What OS ?

What is the DC ?

Also, you cannot use 'winbind use default domain = yes' with autorid, it 
sort of defeats the whole idea behind autorid ;-)

When you reply, can you please reply to the samba mailing list, 
samba-technical is not the place to discuss this, I have cc'd the samba 
mailing list.

Rowland



