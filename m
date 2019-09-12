Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580EB1544
	for <lists+samba-technical@lfdr.de>; Thu, 12 Sep 2019 22:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eNnS7K+fyOMIjWYFYb5vUTrfJZ0dHj9h+4PgFf3+Fyc=; b=2F1apEECKzx4MVXbs9c9iEaxzW
	tfmcZrPAfuxMeZnqOHAFMGHL51hKAPlTNhPLg7oyTTkfLFIOOxywVtIanHeGlOXCVbZg2BvRbj47+
	zpDXQLXCWjBFgx1MRQYh1FkX+HvVtvsU3/aoYch5Uoap0WFMY90BusFsh3lJib5iXUuUBRltNZxSZ
	/TKsIuLGYOeADmv+OQBGSrBJJ8/mLzMFnHU6YLSkeBUAe8v4/9KschcSdIQkmMdVByZlpyF8b2Uox
	DvX4aKWzU3Afbp01tOPi9sW1TwfLefy+y2/oTB3QnKXqFFEcAZ91eD62rahTTMy02dhgKV73hJ1FF
	ouPltwGw==;
Received: from localhost ([::1]:27006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8VXC-0054nT-OC; Thu, 12 Sep 2019 20:17:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11592) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8VX5-0054n4-T1; Thu, 12 Sep 2019 20:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=eNnS7K+fyOMIjWYFYb5vUTrfJZ0dHj9h+4PgFf3+Fyc=; b=ArjWsfNbpIz/fuhZ38wWYK1JUy
 joifvjcccFqs4d6uYGOUwUD8z3McFqnkS1uSoYkPdezZTc0OyPGdH7DIxsmxuQVV7dsOSfvJuBWUF
 Bgx5isLsphOqhlesArhJeU+R8q1wVgDUTs0wvw5dGRYrFPl/gskB+okPm3UwSVqUoeeY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8VX5-0000Cd-68; Thu, 12 Sep 2019 20:17:35 +0000
Subject: Re: Migrating Samba NT4 Domain to Samba AD
To: samba-technical@lists.samba.org
References: <e064bd2a-a1cf-3190-27ed-3cbfff82fa52@wit.edu.pl>
Message-ID: <41ceaa17-011c-7524-9d34-854a25c3021a@samba.org>
Date: Thu, 12 Sep 2019 21:17:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e064bd2a-a1cf-3190-27ed-3cbfff82fa52@wit.edu.pl>
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

On 12/09/2019 20:37, Bartłomiej Solarz-Niesłuchowski via samba-technical 
wrote:
> Dear List,
Sorry but this is the wrong list, it should have been the samba mailing 
list, not samba-technical, I have cc'ed the samba list, please reply there.
>
> I need to migrate my Samba NT4 domain (5000+ users, 600+ workstation, 
> 50+ printers) urgently.
>
>
> Backend for samba is on an replicated openldap environment is mixed 
> (both linux and windows) i use password aging on windows AND linux and 
> use ldap with samba.schema and posix.schema.
>
> Please help me to find manuals for those migration.
>
> I found:
>
> https://wiki.samba.org/index.php/Migrating_a_Samba_NT4_Domain_to_Samba_AD_(Classic_Upgrade) 
>
You have found it, that is where to start if you want to migrate to AD
>
> and
>
> https://wiki.samba.org/index.php/Samba4/LDAP_Backend
For what you require, you can basically ignore that.
>
>
> Problems which i have not found good links:
>
> how to replicate ldap (one ldap server for network in my size is not 
> enought)?

You migrate your NT4-style domain to AD and then just join additional 
DCs and replication is done for you, see here:

https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory

>
> how to use both samba.schema (windows user data) and posix.schema 
> (unix user data) + password aging in both environments?
You don't
>
> how configure and use bind9 as dns backend for samba AD?

see here:

https://wiki.samba.org/index.php/BIND9_DLZ_DNS_Back_End
https://wiki.samba.org/index.php/Setting_up_a_BIND_DNS_Server

>
> how backup (daily) contents of the samba data (e.g. slapcat)?

Nope you would use the samba-tool backup commands, see here:

https://wiki.samba.org/index.php/Back_up_and_Restoring_a_Samba_AD_DC

>
>
> Migration will be try to done at this sunday so i am in hurry......

I will be round on Monday to sweep up the pieces ;-)

You need more time to test and fix problems before you do it for real, 3 
days is nowhere near enough time.

>
>
> Please help me with those migration if you have links for good howtos.
>
See above links and remember to reply to the samba mailing list: 
samba@lists.samba.org

Rowland



