Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C80DA1E7867
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 10:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=Ktigm09Bi8M3m5dA8QLSacSgubWWM4na45i6XNITsO4=; b=0/h2RO8t+IC1DBQpvxna5UsFqA
	Oi8M3yTD/ZHWRz2/Bw1cwayilcGdBDVvL1rJIC8zO9F1jRIX/qbA8zd6vN/bqlxDGDhyoiVIjnBvC
	LCEYnhMqNU5nMBOZDmuFHhZparpxg3YBcHWl8a4Kg9d70HeWuWS23MDJVPap0NSJNUwpBYaonwUT1
	QKvsEzsWxqtp1UB4DC4kxW8BYXTGMN3B34z9zYgXnqNsWHj8L5EEjAPR+n8EdivpR25o/h5aWCmTd
	LnrXhcrqckRVss/+nWFt4KjnGYb9vDKmRNr0K28jh2KWDSWlPuZIxaZ9mPW+zvWXP8i3QYQWsGWl1
	o6MWOj/w==;
Received: from localhost ([::1]:63222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeaQe-006KP4-2C; Fri, 29 May 2020 08:31:48 +0000
Received: from mx2.suse.de ([195.135.220.15]:43056) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jeaQZ-006KOx-5L
 for samba-technical@lists.samba.org; Fri, 29 May 2020 08:31:45 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D53DAC96
 for <samba-technical@lists.samba.org>; Fri, 29 May 2020 08:31:39 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Following Steve's Question - Re Tokens in SPNEGO
Message-Id: <04593936-C78E-43E9-81EE-0311A84D21EB@suse.de>
Date: Fri, 29 May 2020 18:31:34 +1000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
From: William Brown via samba-technical <samba-technical@lists.samba.org>
Reply-To: William Brown <wbrown@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi there,

Thinking to Steve's question yesterday, it would be interesting to know =
from the experts on this mailing list an answer. How what would opaque =
token authentication look like in Samba? How would a passdb support this =
style of authentication? How would a client get the token to pass =
through?

It would be great to know more about this and explore some of these =
thoughts.=20

Thanks!=20

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


