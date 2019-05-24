Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389528F3B
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 04:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xhCiwSqQ4e6ESDBKK01OOlfyhsT82G6jy4qtYF0BEEE=; b=tF7DekMN75MODVi31JHXkuLOMt
	p2LzdPoSrJHeiJLphrJt6Qhx/zrkv1MRDGy9wVAxTtEDERQ99RqNumrwtwJbn5YiP6ou+jHkHxiF/
	PXqQY4CVRUgY5zpYYgS8jzrlE7RbbLLy9dQRo+Jn+t3wcQX8sxkO+y7HtZEv+idnX1H6xF0UcxeGz
	aKHh4+8vDL03wD6sUPyV63a38ZmbeacfQsyLYav2aXuBasZD3z/NN2qiIe36rH72uNgV4GYoqVygq
	O5+c17YuHaItYciODxm4R0LdXDKXu3w+9eYgE9gWIHUUlxzCDOxq4ZXHUR47/vilAcT/CFnjeNTIP
	PwNJxzXw==;
Received: from localhost ([::1]:30434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hU0AT-001WE5-B1; Fri, 24 May 2019 02:42:49 +0000
Received: from [2a01:4f8:192:486::147:1] (port=51250 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hU0AO-001WDy-W3
 for samba-technical@lists.samba.org; Fri, 24 May 2019 02:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=xhCiwSqQ4e6ESDBKK01OOlfyhsT82G6jy4qtYF0BEEE=; b=VC4/uf6Om3vO4gk6FXDRSkG+io
 q6JgWr9+YdbZ2Vu6vVh3uq94v1xmpgZ0vwEGRpD4UrB4hXP+GVj4JLfSZJvBpmqmA5Ff7eRWymJd2
 ZeIR+zghVVEWPJenXty3gkvNgD7n2jD+I6s/4vUsYLBNrUBb5G8TGWi4qmq3O5KdC/Kc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hU0AI-0005P4-HK; Fri, 24 May 2019 02:42:38 +0000
Date: Thu, 23 May 2019 19:42:32 -0700
To: Shyam Rathi <shyam.rathi@nutanix.com>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Message-ID: <20190524024232.GA14980@jeremy-acer>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
 <20190524000405.GJ244578@jra4>
 <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 24, 2019 at 12:18:36AM +0000, Shyam Rathi via samba-technical wrote:
> Thanks for the review Jeremy. Responses inline below.
> 
> +       DEBUG(2,("notifyd: Reloading services after SIGHUP\n"));
> 
> 	^^^^
> 	Please use either the DBG_WARNING or DBG_NOTICE macros
> 	to ensure consistency in new debug info levels.
> 
> 		---- I'll make the change.

Thanks !

> +       become_root();
> +       reload_services(NULL, NULL, false);
> +       unbecome_root();
> 
> 	^^^^^^^
> 
> Does notifyd need become_root()/unbecome_root()
> pairs ? Isn't it always invoked when smbd is root
> and stays as such ?
> 
> 		---- The sighup handler for parent smbd calls
> 			"change_to_root_user()" before calling
> 			reload_services(). For many other binaries,
> 			either reload_services() or (un)become_root
> 			is called first. I mainly kept the same
> 			behavior. I'm not fully sure about its purpose
> 			at this place.

None of the notifyd code ever changes credentials,
so when it runs as root it'll stay that way.

smbd has to change_to_root_user() inside the signal
handler as it often changes credentials to the current
attached user, so might not be currently running as
root.

I don't think you have the same problem inside notifyd
so you can drop the become_root()/unbecome_root() I
think.

Test it once you've made the change to make sure :-).

Jeremy.

