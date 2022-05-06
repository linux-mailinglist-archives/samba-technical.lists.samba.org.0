Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AE51D4BB
	for <lists+samba-technical@lfdr.de>; Fri,  6 May 2022 11:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lQyn0BeXKPw/S+BdA/oAE9NXCerKzKi2Iw81WO8BYsU=; b=rN6ekpVGlRsMF2wP/g84V8GQZv
	MknUuIXpHnFfsPgtbsTfSfY2/NBnjB65Xc/UJ6JvYOaF4BJ+6NgiUR6y5IUfrKuHjDovwZ1Z0QSMU
	v7Tuzaz3duPC+vZxfUXOzUC/mgC/gM4RBN9mP+cYiVgklbd+UMVZ1cobgRK71UDzygfctnqkdMopF
	pQ7WqRrhYD4ypiLeREjOXkSXQ2znrR7iTJ4mm9fjVh06YoVuEhO1luMSE8D3oRH6RPA/zE2DetAjm
	d1bdZoQpLna7SpjeUg7UCOmxxh26CA+vpP8ccG/JkfpSPhsBMCj5hpqM8Yc3cHGY+zBkygA32m57V
	Hpmb6DmA==;
Received: from ip6-localhost ([::1]:30718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nmuLC-006Nu5-Fq; Fri, 06 May 2022 09:33:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11896) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nmuL6-006Ntw-Ub
 for samba-technical@lists.samba.org; Fri, 06 May 2022 09:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=lQyn0BeXKPw/S+BdA/oAE9NXCerKzKi2Iw81WO8BYsU=; b=aLhcGLTJbHa87QO1f7M5ti5pkt
 qx91MrK9EfH2lATj9mbqHd6zIlFkL8sYF1fR8g5EvjamfrCbtHHEBcphj0yTlr7im8kfcOtDYRT8N
 wSMEmQGoh2vmTqE9rrDdqyvNj2nDP4iavGiIjEtGNDtBXd16lnEyUC2UgfBkju0iZC2RBc644Gbrs
 BvdBefeXWZMoc9RASfCKTXAFuUoBr4WUfuVGA4XhLod1tQo/PbfZEaM7+BJDOdRUYAU232Sp13nyP
 7i+dyDLGcFBnR6rye9ptA1aGaZ92fDAxL2lT5Z1dEyae4vCBCKXu5IdIhBlqrOtxhaZlJsrhYiYvE
 m98ta/00OwEuSuinwwMkhcg4xs1OKA0BMoFvGIyvCwwMc7cXgsClTTR38UkZu3sdb9us5WPXee0ex
 Ou4n4KN66f8pB6HjsSyVKb8wDYjg5TKfd9AzCgKEB7zoBTm3tPkOJeH577DgN1QnsrJk7xsHQRm95
 GxVAzPFkzseTaepqwrEEpaBz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nmuL5-004V9N-Mp; Fri, 06 May 2022 09:33:31 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Can someone try buildar for building our bootstrap CI images?
Date: Fri, 06 May 2022 11:33:24 +0200
Message-ID: <2773692.yaVYbkx8dN@magrathea>
In-Reply-To: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, May 6, 2022 4:57:23 AM CEST Andrew Bartlett via samba-technical 
wrote:
> With GitLab CI starting to be limited soon, it would be really helpful
> if building a new image for our CI tooling didn't require a privileged
> docker, as we don't want to enable that.
> 
> We do this in our bootstrap system, triggered when we want new images
> as the dependencies have changed.
> 
> Currently we rely on the fact that the shared runners provided by
> gitlab.com allow privileged operation.
> 
> But there are tools that replace docker that claim to allow this, eg
> buildar per
> https://codefresh.io/devops/docker-images-without-docker-practical-guide/
> 
> It would be awesome if someone could have a practical look at this and
> if it really works in our use case propose some patches to move us from
> privileged docker to buildar, yet still upload to the same GitLab
> registry.

With podman you normally use buildah which has a rootless mode:

https://github.com/containers/buildah/blob/main/docs/tutorials/04-include-in-your-build-tool.md#rootless-mode





-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



