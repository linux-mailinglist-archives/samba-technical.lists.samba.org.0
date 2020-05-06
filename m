Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A56381C7776
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 19:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zx4A6sxWj79ML2fq1bwTQbgzzOhvQMG210dPCMjH19E=; b=1vjbQVQ6v0zfaI4mUicdEICiKc
	ZeBhg5PycPk5L3Avt13AZ7djvhZwC+52hbGW2x64P+2+WNULkZm9MmFKysnq+ITr9bSm07Bjv4XSK
	99IB2dIz//rY2usez5VCbrn+nrFDVfvc+1d6P1MJq2sZ0OASfvCoyPHejrFmFCbG3XKoA+OK+JUtx
	2fGiVOfUsTCULYuoWqGUZVHx8CubpaQGvXYN5oosgrqOAH3VkBnglTxk1tP+Qq3roNBQhjKmxv4Ka
	5G8XkT+04bZrBYlmL8QGEFbzP82dbGIZSOvPDqPGdFlL4Iu4G/tV++Ver8wcSjvssvk1TnU2Ka44F
	MLVOpiXw==;
Received: from localhost ([::1]:49236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWNYW-0032x9-UD; Wed, 06 May 2020 17:10:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWNYQ-0032x2-FU
 for samba-technical@lists.samba.org; Wed, 06 May 2020 17:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=zx4A6sxWj79ML2fq1bwTQbgzzOhvQMG210dPCMjH19E=; b=2zRV6toB60cJak2Q0zXv5j2j00
 Byp6rILrurHciQevXXFLta/Jy/fdJtB6M5co4sYBtkr/1T1Zyj7uvVxXG49CU69OoQ7feWJu/skDy
 cXpwzObXjMsPpsEYL5Lk6pVfOlQB/kBpI7OkDbzu1+WUgx9ehaWgb3hDfJFoXxgoGINQIX0rAijgV
 v4HBkYH/2IHrVQCaALSr/PVXAFxz0LemLA5LIAJ6yhO/p5lhlggBW4LdhMl+dgmhbrP+Gnasmwjuk
 /EVfnVukJKy2hFUdj7CJusthm9gHpTW6aiINLmHHdCABtZjKZOzkPYppqJh3h23doL6E6d1qNmalX
 ZfGJmo+XtTqaP8EJmtrmhakfCKG+nx5iH6OCkle98YuPKnqEsfHvVawO8Z7Br/2udiP6D3cs4juNg
 GzoAez37+WxGeP3IrSbXhIBSx/ZJjz9aOKkn2Dtef16BTGB5wy4NXkKhKwLkB3zaskhC52vnGDfrM
 +a+Em7aAZKNqiIec6hqWiXBT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWNYO-00085m-5J; Wed, 06 May 2020 17:09:52 +0000
Date: Wed, 6 May 2020 10:09:46 -0700
To: lejeczek <peljasz@yahoo.co.uk>
Subject: Re: Samba with GlusterFS - the bug is back?
Message-ID: <20200506170946.GB3447@jeremy-acer>
References: <4b3fdecf-e666-dd76-d618-0150b2549f07.ref@yahoo.co.uk>
 <4b3fdecf-e666-dd76-d618-0150b2549f07@yahoo.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b3fdecf-e666-dd76-d618-0150b2549f07@yahoo.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 06, 2020 at 09:00:34AM +0100, lejeczek via samba-technical wrote:
> hi guys,
> 
> I fear this or very similar - https://bugzilla.samba.org/show_bug.cgi?id=13585 - is back and I wonder(must be no me alone): would that be(if this same old bug) Centos maintainers' fuckup or it's in the upstream?
> samba-4.10.4-10.el7.x86_64
> glusterfs-server-6.9-1.el7.x86_64
> If anybody here is a glusterfs mail list consumer, then it's "Unable to create new files or folders using samba and vfs_glusterfs"
> 
> I'll say this is a small catastrophe, once again, for all those of us who run with glusterfs.
> Would you have advice with a quick fix and/or workaround?
> many thanks, L.

Can you re-open a new bug and assign to Anoop. He's probably
got the resources already set up to look at this.

What Linux distro are you on ?

