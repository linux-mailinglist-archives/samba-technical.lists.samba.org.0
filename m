Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE178D132F
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2024 06:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=aFJgfYcVP2+ckm1/sODWAZRIOXEsW9CCMvNOMEyLKm8=; b=pLDyT2PCcQ2lf9wi+KZdFv/GVQ
	oBvJWXH6IGEpXhSRBKDyp2p0RpMBQ7IVuU1YRZ8ohDTvgV5bHqAAdbLC14tOZw8cnZrWwND6Wem64
	22EKjI6WoXzyxRptPQyvqQxji7F9NAT5HEDaVz+opUi5pAdGLSbS4EcvJYMjsinyqrvfVDtQuH4CL
	OGMZCAccFFbrajoW3spM5FW3Nn83ntWSzUxiJ9SxYvEZlVY9WPFHh68YU36excG1isj14HkBx1hz/
	q402GwR4A6RId/1fyxxALYa0wa3E1gSJN7G0Pv0kxu4WfBNR+Gj9Yf7kNeFGPb2oyA4497npUDDMo
	xJvXVcQA==;
Received: from ip6-localhost ([::1]:42576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sBo3x-00A4Oe-Kh; Tue, 28 May 2024 04:03:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46352) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sBo3t-00A4OX-3J
 for samba-technical@lists.samba.org; Tue, 28 May 2024 04:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=v1wQpxOFgkwl2sg7tVqGoUc8toSMzqRtQCiktiKPXiw=; b=GK4Be5Odx4O0IuEff8z2RQxLAH
 tieGK+tB5wvB8/gSv+PcaK7A4czOG/ntyF6/k1R+kqxIJpJoBoXH1o5lt6Jokui7P7qQvv2claBOb
 18rTAvWbb+EqIgESGz/ymv9Wq+LaxNCYvNVmFZfLOenJ1idwCPv6h26NfFavbbTigVHi/KUp3yQ2J
 oZ2xWLgfnv1zdAO4WggYfTTFRDSANKvDtUtPMjYbh2Cekd65nMR5utOd40BKT93mr2FO7hF7pGK9u
 taYRdtTKQuGvKfZzqs2JliCjuJ5StM6F4n0TVVTJ/0t0i42Gf5fhouFAZi3ArHUgNCN8D8RPdpnLF
 AidrI/z6xvcJuhYdnhSPakILutnC5dadR+WTJ+2RYeq7vrCTJsrpxChenDvG/e+1J4O6wPoRLlYZZ
 eRMivQkB31MWh80ousdCG5Rf2UDx+uKUD2ZfpkuoxVEcim3sIlJiHRYMUaPgqbQEPWWMK5/Z0Y0hK
 t4l0uZi/lnE1KAtT5WHtQXXY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sBo3q-00DWPT-0V for samba-technical@lists.samba.org;
 Tue, 28 May 2024 04:03:42 +0000
Message-ID: <fb2731150f297e7f8958fc7feaf3c8cc510b7fe9.camel@samba.org>
Subject: Tidied up some GitLab permissions
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 28 May 2024 16:03:36 +1200
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just a note (public, in case I botched access for a non-team member)
that I've tried to tidy up some permissions on GitLab so that folks are
only a member directly of the shared development repo if they are not
on the team (who has access from the group). 

I've not done the whole list, just a few.  Some of you might have got
some scary mails, but as far as I can see nobody has lost access
(because of the indirect access). 

I've also removed the 'catalyst samba development' group permissions, a
hold-over from some very early days I think.  

I had previously tried to set settings that would have not allowed an
outside group access anyway.

You know where to find me if I need to fix something, or nudge one of
the other gitlab owners. 

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
