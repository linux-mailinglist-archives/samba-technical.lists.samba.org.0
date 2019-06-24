Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1276E50614
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 11:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=NJHkWHeiGsf16h1lMdaA5mBJgsVdHJ4CqsdIf4/nVsI=; b=zOBRnXLUJhhevRwsdQ9vo7b8sW
	I0F9b8m/lgtkL4wc6rjPZk/vVWSLWla2n9P6tHLsPdlOVmnoqXEMgHyg+Zwyrq5NMlkmVtbICWyU5
	CqbrokuKJQEI5k+6oKUhUmeZYITF5PvbcldWn1OltzOsI2WiCAPIxnY5zUfV6dij8ZiO6qyple0Gr
	qDCPOLDlm6yAi0NOHWS11kMXUUoSwTbvgWj7KxyFap+PCNEgx1twtvq906tlW5QQLzXVa8SfEQH20
	YSM3KfXiEbhU7e4AF0hwsXMCO0jUqXCQL8QqY0h+guuCznB6Vs7wNvw0Q5mxMHJzmOR9+IoRSrSxP
	qjyOketA==;
Received: from localhost ([::1]:50298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfLZb-001RB6-GB; Mon, 24 Jun 2019 09:47:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfLZV-001RAz-I8
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 09:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=NJHkWHeiGsf16h1lMdaA5mBJgsVdHJ4CqsdIf4/nVsI=; b=SoFSiW3Z5pFNPw8cXA/4TDbx8o
 wSqDggaNL8wVppDlHmbR1gv7zR27LAP85Iqqu2Rn1bd0bTPjIrXmOaqKAe+OeZdGWFEDRaEGrHPyH
 FsnwZOctSgmhJgLyDdcC0Li5OnGyt3j5/PDq0WGju6Iju3Nl0ATYEqSTPUYbxv0xlbmM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfLZV-0003xD-3L; Mon, 24 Jun 2019 09:47:33 +0000
To: samba-technical@lists.samba.org, Amit Kumar <amitkuma@redhat.com>
Subject: Re: Can we RESOLVED/FIXED
 https://bugzilla.samba.org/show_bug.cgi?id=11777?
Date: Mon, 24 Jun 2019 11:47:32 +0200
Message-ID: <53849520.SDZurjuFE3@magrathea.fritz.box>
In-Reply-To: <121489a2-9794-9084-e0a6-cc23bce7f0c7@redhat.com>
References: <121489a2-9794-9084-e0a6-cc23bce7f0c7@redhat.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, June 24, 2019 9:58:21 AM CEST Amit Kumar via samba-technical wrote:
> Hey,
> 
> Sorry to bother all, But I was just looking for 'net command' issues and
> found some have already merged patches.

Done. Thanks Amit!

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



