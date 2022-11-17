Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B462E3F9
	for <lists+samba-technical@lfdr.de>; Thu, 17 Nov 2022 19:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=tah2vv5nWkv+qa6riX3VIKHimJYqcFTMj0Hi3I093Gk=; b=FQTzPi+OTjmG7ZJWv8aKmg61yF
	zFW8NdZiOetYkWSOSvFDuiCd8QfLugJ48ExNgWO+tta6MeFsJWXIBex0QGDvTTQNTKmzBi71k2y0P
	ytpT9U7fakj2RhFad47S1iuAUpi+BXTzkB50Cfjkj8DFDX/Vf0WwawZIKCo2jCLOzNvpi0f2obVtP
	CZ5zrag5YSa35LfLHzH4v7+CBvgT2mzZRQVFcx4jVyBSKex7XNMNxL9QJ717GTqYf0FGvV7g+A1bG
	sCaKlfaXzcrjRsRTJvBuNgwoCBoNddYeT9mO3tj1HVWTDO5+PzyzzFf6+sO37g0Gxvhbm1CO7iubO
	MRCAui4g==;
Received: from ip6-localhost ([::1]:52694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovjTs-00F06s-LN; Thu, 17 Nov 2022 18:19:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51142) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ovjTn-00F06j-CU
 for samba-technical@lists.samba.org; Thu, 17 Nov 2022 18:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=tah2vv5nWkv+qa6riX3VIKHimJYqcFTMj0Hi3I093Gk=; b=CyPeUtpXqvDXbo9fi1MXyu3O/f
 BemjtJqugyXNPg8YqqkcFSUFZ+0jXEbXF8kRO949Hd4c3cz9sogvoofMVfP+wHDywhMUtYkdPuNWw
 rbIPJ6Op4+uTG5pKyCm+mawtjLm/F5r/Cc3uoimyIaviDXVWN10AQ4VVe4l5RgLMxmWWE3/9+EWM3
 /pMAfEIzIh5IbOkMQd6Hp6EnsLboNnGsTfNYNCKYpGjn6EWswroswfvy3u+2sRi/5P7Q57n9844Zq
 tQbAUbzXE1Crwj7bO39d7/9SbVmvO1ejfD3NW7Uoo/tC5T8Ef/L5t7pd+X1EfHN/iT3J5rcxkxLre
 dE7Y3CKpJx2WxiWZo2QDejlqg82wXdUwPYt3DeGlK7Cm9weG/qwbyZs14QjnDo+I2TpEgxRAAaGh6
 fvMJrlvnGFlXl5spdPJqHkqDHRHgcdj/B4g5etUL9BxgZ6ntURU3DcIj+kwbIHQQYdY9X7vejljw/
 Bg5AwgsJRPu1fqsmm0dISUwm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ovjTl-0095gy-8G; Thu, 17 Nov 2022 18:19:13 +0000
Message-ID: <8839e48b176f6bf40d9e1690f304d05095b53e66.camel@samba.org>
Subject: Re: Can someone please build us a 32-bit Debian container image
 please?
To: Michael Tokarev <mjt@tls.msk.ru>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Fri, 18 Nov 2022 07:19:06 +1300
In-Reply-To: <6e43c434-ff08-0b9a-4c35-3a2e3117f7ac@msgid.tls.msk.ru>
References: <c2802ea35aa48ada6a638c31ff19b7235845c268.camel@samba.org>
 <6e43c434-ff08-0b9a-4c35-3a2e3117f7ac@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2022-11-17 at 15:45 +0300, Michael Tokarev via samba-technical
wrote:
> 17.11.2022 04:02, Andrew Bartlett via samba-technical wrote:
> > https://github.com/docker-32bit/debian
> >  is GPLv3 and small, could
> > someone please adapt that into our bootstrap system and buildar and
> > have us build a Debian i686 image for our CI?
> 
> I know very little about docker, but I do use debian images (and
> other
> system images) quite often, - in particular, to test samba and qemu
> (which I happen to maintain too).  I use various images to build
> samba
> for different versions of different systems this way, too.
> 
> The procedure outlined in there is trivial, they use debootstrap to
> install a base system image into a directory, create a tar archive
> out of it and import it to docker. Debootstrap utility is a shell
> script which is supposed to run on various unix-like OSes.
> 
> Andrew, what is needed, exactly?  I mean, what should this image
> contain and how it will be used?

It looks like metze has made a start, but I'm sure help is welcome
because like many things in Samba this will be easy to start but still
take effort to finish, and it is thankfully an explainable task.

It is also a good time to explain how our multi-OS selftest system
works, at a high level.

If you look in bootstrap/  you can see a README that explains a little,
but I'll also overview things here.

Our CI system uses GitLab CI, and our .gitlab-ci-* files reference
'docker' images (now a standard, OCI I think) when we build with
buildar.  

The packages they contain are set in bootstrap/config.py and rendered
into shell scripts under bootstrap/generated-dist

These are invoked from a generated Dockerfile when our CI is started,
provided SAMBA_CI_REBUILD_IMAGES="yes" is set as a GitLab pipeline
environment variable.

These images are then pushed back up to a container registry on the
GitLab server, from which they are fetched during later parts of the
image generation run, as well as in later CI jobs. 

It is important that the ultimate source of these images is trusted, as
the docker image it produces is a trusted part of our build process. 

(This is also why we can't accept community contributions of CI hosts,
and rebuild the whole VM after each task, because the CI system in
GitLab is privileged, and can act as the user running CI). 

Metze has chosen to start with the i386 community project, which is
hopefully enough for our needs - when I looked I couldn't find the
currently maintained versions of that, hence the bootstrap approach I
was indicating.  

Finally, the big task is clearly now to produce the i386 image, but to
get Samba to build under it.  The failed pipeline log here:

https://gitlab.com/samba-team/devel/samba/-/jobs/3340360869

shows that there are a lot of things still to fix up (or ignore, but
the point is not to ignore things long term), in this case in the
upstream cmocka.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


