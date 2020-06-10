Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 923F51F4CDD
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 07:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ik3FoVq4J2xa1o+blMpgG54TAjHItCCk9CLa6jPp994=; b=t4Vh1JvS0p2ngkBoI0qS6IO87N
	aBIDUjPvCR3IrzWdRhoYnPbpVbkgAGQ6bDg3hP7/EQqemkg7jK2l39BWWS+1stxX6NKLjfA87mPQi
	wlZaLB/KfdPTiXZV9QTxjSPEfNqwrIr6a672MUSuMcLM1mHsK9YeEXRfWjlu77UU9+LWDhGwoEPvs
	1gbZkM4rH7gkPyoV63QJfAo3sfUNCskBR5b8Pnz/0e6rCFfoekrl3bPncIrRNKFNfkh5zbHtpy0zF
	U9FFlUTm/JJZoRsj451ftX/PfYj7gs4tbCd/XkvPEDO5CqRJ1cGGuqB82RbKi286iTh0al93p9MQ3
	OI9szeYQ==;
Received: from localhost ([::1]:64868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jitFf-009hKe-RR; Wed, 10 Jun 2020 05:26:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jitFb-009hKW-UL
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 05:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ik3FoVq4J2xa1o+blMpgG54TAjHItCCk9CLa6jPp994=; b=zViwqGhEwDtc9yj/K7hDUveCwA
 fZ5SNlXBKZba7+UYrlE4MexgEDVQ8h1xga1o3CcteN67MDQAhbE7s6BBXof0eSp4vU//5EE2HiL8z
 X8fDT753h/sNaacdB15iMtgoRSVSi9QVfGhi+/8UHCLrqNFSiV01NbxQkfcxPneU3TSvQDi5zQEuC
 KK6dKybRLd+fu90sDAX+grw+b2ILWBEtdxA99z3F22/iY2gGh3ZybUxKT0YchdT5j7MaFbSKh02cx
 Lq+IymZrN0ughNH9dYjc0kf24ToamNhD1Qq5ZGeNQ9CUotZRc/cXInowABtC+PMmUGjW4SHkOJDH5
 VLu3CPdTxn4Hn94yU8JzKaV1IckSCSC7VqLcjeU5emwB9dor0EYbbwX2IX2QH9ZuYlo3Ffz5/GDVw
 s4dscRy/rcadhxmSE82ZEqo+zqw29IgkUKq6F9VpFXsULMn7xm1GflfUGfv7jDzgrYr0u72w8TCTQ
 OoDWwefvj34hIE+Ct31OuwI7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jitFb-00039m-9G; Wed, 10 Jun 2020 05:26:11 +0000
To: metze@samba.org
Subject: Accidential push of patch was: [SCM] Samba Shared Repository - branch
 master updated
Date: Wed, 10 Jun 2020 07:26:10 +0200
Message-ID: <12540524.HQrcsopkBd@magrathea>
In-Reply-To: <20200609172503.C9CF014037C@sn.samba.org>
References: <20200609172503.C9CF014037C@sn.samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 9 June 2020 19:25:03 CEST Andreas Schneider wrote:

> commit b458f8fbb7febf3584fa648128b4e1dc764059f7
> Author: Stefan Metzmacher <metze@samba.org>
> Date:   Wed Aug 7 12:11:58 2019 +0200
> 
>     s3:libsmb: add a cache for cli_session_creds_prepare_krb5()
> 
>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Volker Lendecke <vl@samba.org>

Ups, this was pushed by accident. Should I revert this or do we deal with this 
later?


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



