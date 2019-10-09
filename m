Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE317D1C58
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2019 01:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=K8H/DSkP2ZakixGLDSiImYSbOb0fFztZXHX1fPXI7qo=; b=dIU9hQygj7z0uBb8B+Q0LVLa5w
	PJn10/nZluoCjtjZmjaE4sRK4fydXBeGZq5K1/292qvhZuTQlQxBD0MSs+8GDhTlyzfB6gb+Y3YHR
	mX75HH4WjchrNazrsiYlS7p5nswj1WW5dd1YeCKz5BrtRmuSNJefbRbH/Q8Oe7D20KbLXDGn2E4Z7
	Fm7s3aCWwRRaHzvZVLYD7uc/YaTGZl2GV85uNeb5W/wjtGyW43CO3IY1gvxmvC/XQcRT8BIh5eYkD
	B9A0IIr3jvEZM4vZDfocy8fRfklU9p+08JzPBDYPTthc3Kf9FEz+qt7eCSRDLnAXjpud8Xx4WyO70
	uTe8jnHw==;
Received: from localhost ([::1]:48398 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIKwu-002VNM-CM; Wed, 09 Oct 2019 23:00:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35954) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIKwq-002VNF-Uj
 for samba-technical@lists.samba.org; Wed, 09 Oct 2019 23:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=K8H/DSkP2ZakixGLDSiImYSbOb0fFztZXHX1fPXI7qo=; b=zbipYgzI9Az2nTEs9sNzWrBLVj
 AfapTaAHHXfTohJDo1wold0m2976W0N0WMamYT6iRhC6hFHiOCogRGqk2cDKLcANptY7eTi6Hk5Wj
 mSQfnhozq+4GH+Tp4WcwKPjDv+RPI6MtwUN3hwPXAICtvuae8BChZ+DqO32NqvwquxI5vtb1BWZwR
 WN9yecAgDpod2bRjGSXjLoqDX6UCVdQSi464j+CiRAWJy154BZnfNk2RUyR/Yyx5dBkiFwsKSMAbR
 iW7LJKUNFBjxlLAY7a1rm77Zl7pJ2Y2/jofE7yRkhQule44LHDCUDhFcgybIY+cRwHjBfsmrPPokt
 Is1AuxxBN2QWVfN1AgSaazO3SouqhEmnaW+3Kc+Ki2epYUWMMje8oCsBiXKxfelYiIeMMKTEqqPSS
 9oedCHspm3gjAfwS8vXgcUYiubavJCrwBjb9VvWUOR+K35xXxJozmN8n3yi5bdtnv+XARpLx/pVGX
 3r9M2iWRRmFMcratxHSGFr7t;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIKwp-00045K-Qg; Wed, 09 Oct 2019 23:00:48 +0000
Message-ID: <cbce6ced00356f1563078c793a4afb7f69960aae.camel@samba.org>
Subject: RC4 support with kerberos (was: Re: Samba and legacy Windows support)
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Thu, 10 Oct 2019 12:00:44 +1300
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>
References: <5849953.E8HlOTvGIY@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-10-08 at 10:59 +0200, Andreas Schneider via samba-
technical wrote:
> * When can we remove RC4 support with Kerberos?

I do note that unicodePwd being an unsalted hash is used by a lot of
folks doing domain migrations, and (when it works) the Azure sync
service.  

Also the password history is in this hash.

I would like, if I ever get time, to build a Samba mode without it (and
with a crypt() hash as an alternative inbound sync), but it will be
with us for a while.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




