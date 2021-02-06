Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2F312087
	for <lists+samba-technical@lfdr.de>; Sun,  7 Feb 2021 00:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=R5Y0O64jPP3BFiW/OrmpqjlJZ/nX2qt43/DtaxO3Bs0=; b=ZuKiqYIxRK0lIRjn1quHECchD+
	GisTQAWVi3OXXrw2m+3VIEiDOgl+/1q+wi0KqlOzPubAJOkWPp4Yh5/jtRXBT393dGrpWON0A9Kq5
	w7l7T0tJFQDaq459uetVGhhf1BCXlU4GgThVrKt4t7pGhiiDXom3qwSxhQcbWCJ+giLcMeOV5qOeM
	SAi9ADWRmoViWt4Al84Ctb57b0stDonLNiLW58QBnBePyNlbsWO3ihiptIKFBUcBYbEKdLl2Q4ISV
	sr4S7tNj3K6DLBZahgTa6eLx+KRG4ujor5zNUEt6YI4H88BjU7P3MA0yMy38g8gtvh322fS85DamJ
	OZoOg+LQ==;
Received: from ip6-localhost ([::1]:43854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l8XGi-00BS6x-Lk; Sat, 06 Feb 2021 23:45:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21400) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8XGb-00BS6q-Iq
 for samba-technical@lists.samba.org; Sat, 06 Feb 2021 23:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=R5Y0O64jPP3BFiW/OrmpqjlJZ/nX2qt43/DtaxO3Bs0=; b=qzYEXEmdVyQ2Gp/2LH1l3bbros
 bulS43kg5aleQdP9A6kyXT1JofKz+AepP6+95K0Rw3IZjnSfb8KWVMn4H5zRKEkyZV9XQeSI650pE
 If7sUsQSFfRlP6vRgBl78hujd6hy3OF/JxR4trECM9ejqMdzbbchqyJsXdmx6X1kTnkjEl6f3phUb
 PnSSHasTnQZg/gt10KKgtnPavjJ9mxVqN6tJkwGRJ6KWaY/8V1L9urGB4dSZ5AdI90YK+q+DI+bDj
 y3gQ2Mowf9DjmaSJfaequQpOFvYyE3HQWt/aarcV+4Eb6y96842nE5s9MHogvKbV8/vcrwk4xInQw
 fY9+d0uzQj8dAtPuKq3SuY4Lte0KJeApxOZa5jS3KQa9Nc0j5Ag+JBWR0AjgdUmrKi9WLiaEpfs6F
 gwU142CKbftTdUcIKIINvusxCfHXANjhD409FRCcqrZaaeBXKRa/SvQehnFEeSEx/vh234hdTp60E
 VOw95hmxxwUkvKSnIY4sPZUm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8XGY-0004xs-Dg; Sat, 06 Feb 2021 23:45:26 +0000
Date: Sun, 7 Feb 2021 00:45:21 +0100
To: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Bug in Printerdriver upload 4.14rc1
Message-ID: <20210207004521.5e1076ed@samba.org>
In-Reply-To: <14e9d56a-2e0f-6bcb-179f-d5f487f7bd2d@kania-online.de>
References: <14e9d56a-2e0f-6bcb-179f-d5f487f7bd2d@kania-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for the report, Stefan.

Please raise a bugzilla.samba.org ticket so that we can track this as a
likely regression. The script should also be helpful as a future
automated test.

Cheers, David

