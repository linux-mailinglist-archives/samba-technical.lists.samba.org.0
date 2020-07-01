Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD54210C37
	for <lists+samba-technical@lfdr.de>; Wed,  1 Jul 2020 15:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jk8RJSdeZ3iRiKwg9nwb9NeAVxdIn8q059ESchgsshQ=; b=nstY/cSnO3mxwdlQOPddTsEixp
	jRP1XzGz9MBSH5DSgN7/Tkqno1FxNv0wMDbH3X6ob2Ke3HFSMtA47zq8Phy7zSzkujIr1G690SJ21
	xwvRE0rg8W6bzzogCz+/cc/2DGLPqGFrBwryQEAWTES+GLiS+YjHdVjYjy/FGgo6igGzBBmxL7NNa
	ln4RYoZIpovFgjmWr9ibuTf1Sf3DBXVXyc0HsHko5/nLvyGAAeK95hJZEsU2n61Dt4rpaTYWEOzaw
	6LxpHA44ssJj74TpR09gsyh+mOMLGitKvDPm+lryRnmRgySgLgguyHLx3W2BHOWOaGyDJJKID41wm
	CcfryDgQ==;
Received: from localhost ([::1]:36064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jqcoE-004pCH-Re; Wed, 01 Jul 2020 13:29:54 +0000
Received: from mx2.suse.de ([195.135.220.15]:40986) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jqco7-004pC5-UK
 for samba-technical@lists.samba.org; Wed, 01 Jul 2020 13:29:50 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 634C8AE17;
 Wed,  1 Jul 2020 13:29:45 +0000 (UTC)
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>, sfrench@samba.org,
 corbet@lwn.net, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: CIFS
In-Reply-To: <20200627103125.71828-1-grandmaster@al2klimov.de>
References: <20200627103125.71828-1-grandmaster@al2klimov.de>
Date: Wed, 01 Jul 2020 15:29:44 +0200
Message-ID: <87tuyrxt13.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

