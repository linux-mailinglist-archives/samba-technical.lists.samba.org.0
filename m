Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15D10DD1
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 22:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=t0JzrdrcmXOlVdWGuBEue+Aue9qnusHKaGYiU3dwmc4=; b=X/wf/Iap5a0bHeEyDWn5hxc/Ag
	1+fGNexOJ/fr+uBUUXY0s8ULjNfdt+NqbQknoXhijTas2WzlyMD/4d9Fa7KljHq+RZLV8jrkZzfLT
	LaJuQXePgOTJOVQo4aNiJAFaCAyToe0/BkOdYSqhGyE3OEH8gwIVksR/vcEvh31YDAx59V6KhIZI+
	nYSGcKakGbzKLTl5z1joMcYF6Nk9/OzkVPy7z02kXZibjtaCUpwGIhe15r0+iKdaLzHEmHl5N52zH
	EefZ4wlBLhkbMqNCLJaEcrtUj4ftLqaTVj002/K6w3hDXbJFsVcXdc++xY7o6380+T9ab0L8/GS98
	PUDd4LzA==;
Received: from localhost ([::1]:45950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLvca-001t6O-H4; Wed, 01 May 2019 20:14:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:25966) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLvcV-001t6H-UJ
 for samba-technical@lists.samba.org; Wed, 01 May 2019 20:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=t0JzrdrcmXOlVdWGuBEue+Aue9qnusHKaGYiU3dwmc4=; b=RzquwKO1cn+u2hVx8H/SGAnX0S
 jeeVCZJFxVc58H/g2k4M3cp1fLyNd/n4hzxwoF5FoS4NKXPkDvLtQ22NJUBkS4L+gOod0UoXjvdAp
 dUttCHFffLd/jkbMDzFIEgSkOVhho8UnYeTpwWb5IefH9te6yu9QFVIToVZPqL1puO7o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLvcU-0004t4-3w; Wed, 01 May 2019 20:14:22 +0000
Date: Wed, 1 May 2019 22:14:18 +0200
To: Robert Sander via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] use current working directory instead of share path in
 cephwrap_realpath
Message-ID: <20190501221418.0a115c99@samba.org>
In-Reply-To: <2ccf782c-f2fe-2ed7-23b6-fdf336b1d172@heinlein-support.de>
References: <2ccf782c-f2fe-2ed7-23b6-fdf336b1d172@heinlein-support.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Robert Sander <r.sander@heinlein-support.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 26 Apr 2019 22:36:24 +0200, Robert Sander via samba-technical wrote:

> Hi,
> 
> reading symbolic links from a CephFS via vfs_ceph does not always work.
> It looks like the CWD instead of the share path should be used to
> construct the real path.
> 
> Attached is a patch that changes this. Please review.

This looks good to me too, so once the sign-off is there:
  Reviewed-by: David Disseldorp <ddiss@samba.org>

Looks like Jeremy also raised a ticket to track this, so please also
add...
  Bug: https://bugzilla.samba.org/show_bug.cgi?id=13918

...before your Signed-off-by tag.

Cheers, David

