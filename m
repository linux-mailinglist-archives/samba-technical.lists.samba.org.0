Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924C8036A1
	for <lists+samba-technical@lfdr.de>; Mon,  4 Dec 2023 15:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=cDjE0BIoaEtLnZtl6OMSzJtymgJ/Fb/SLSZZLAd+nkw=; b=vwV/lHjoOrF01wG79FDjqbbYD1
	P3N4j7eIa5rHnpsIBD6u7TQqmQNBfL33H5nmvlAHKpF6tJpeIcFhkpvNDV6dnLg+pbULOEFRFCuCf
	MgmKPt0JgAjlkusP8wjU9JnUA4Omb5WAMVvo5E5+rC1IR+21zxZLK2sksj7aodUj0lm6Ds9EDkxTv
	vWMgIFt6sZX8g5qbN3q9W3LIWr01ZSvn4X0ZjF7Cx6yxhcSAyF3+kmbdYVBAmmdgLyt6H98NYuBhw
	jSucbzPpxsWVSROheTlufu25YkxDVI6qAnag7W/jfg5maYwGMyl3G8scE/2cyXNHgLPN2I+2Y5WeG
	Xf52sxxg==;
Received: from ip6-localhost ([::1]:21238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rA9v6-004Bhz-4p; Mon, 04 Dec 2023 14:27:36 +0000
Received: from [104.200.28.160] (port=45144 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1rA9v1-004Bhn-Bi
 for samba-technical@lists.samba.org; Mon, 04 Dec 2023 14:27:33 +0000
Received: from edfu.localnet (c-73-114-43-44.hsd1.ma.comcast.net
 [73.114.43.44])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id C96241508
 for <samba-technical@lists.samba.org>; Mon,  4 Dec 2023 14:27:27 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: TLS issues with www.samba.org
Date: Mon, 04 Dec 2023 09:27:27 -0500
Message-ID: <5999991.DvuYhMxLoT@edfu>
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Apologies if this has been reported before or already known, but I don't 
remember seeing it discussed.

I am currently unable to view www.samba.org and bugzilla.samba.org in Firefox.

wiki.samba.org is not affected.

The error reported is:
---
Secure Connection Failed

An error occurred during a connection to www.samba.org. The OCSP response does 
not include a status for the certificate being verified.

Error code: MOZILLA_PKIX_ERROR_OCSP_RESPONSE_FOR_CERT_MISSING

    The page you are trying to view cannot be shown because the authenticity 
of the received data could not be verified.
    Please contact the website owners to inform them of this problem.
---

I used Firefox 120.0 (64-bit) and 119.0 (64-bit)

Possible related link: https://support.mozilla.org/en-US/questions/1259329

I can view the page on chromium based browsers.

Anyway I thought I would share this with the team in case this is news to you.  
Thanks!

--John M.



