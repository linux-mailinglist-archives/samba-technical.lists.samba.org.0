Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E925290E4D
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 02:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=BYtC+Pdu8MHhujerlFpPEiykRy7UHYYqi9M8cflRbiA=; b=bNewOaT5cJlir9vuCFh8nE/qfO
	jTGxZ8v2xLkg3MMmxLxk58LWG/QSx7o9vf0boqKRCoFaR2w8jPPG6C1bdGYYOPibHDmiRlyK4GttJ
	7dg+gu47qcxPxKDNQqk5n18pFEGsJmFQYskSqDL21DE82hm/2vknto1+lkafO2nEY/2M55PPF7GLf
	HfvDgQlSmllcJp5BdWbEcA2hBjkaVAhWtimodkM0HC2M1a1CTH/2n5Qs/WAAe24gQBSY2Q7ZnzQlL
	pveQ0lbiu/qawgfHkc4qVQi9zEOJrTbioVUGeH0giYStJy6FXMS2+I70p1VqRjbm4RKJuqAmwAG2l
	J4m1wa3A==;
Received: from ip6-localhost ([::1]:22906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTZdD-00CTZG-M7; Fri, 16 Oct 2020 23:59:31 +0000
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:46092) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTZd7-00CTZ9-S3
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 23:59:28 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 65FCC1280F53;
 Fri, 16 Oct 2020 16:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602892761;
 bh=DdzDBF5hxmylwSICP513biIU2ssqzxXVftcSL0yfUD8=;
 h=Subject:From:To:Cc:Date:From;
 b=d13qckcmp0cOmpe9/ZtJwrkz+bo9I/1cyZN2ewPBBlZTSS/XXN2RjOMDFCSjoogXB
 OeH53RvuBWh8WQaxCjdqIQPe4epn4rUuAVprrr9fBCO+Jh7cFVJ73xFPIuC8oT/qx3
 xxiw8YJgipmyW6bbB1waCCqkKcxsFNVVxdeeUPFE=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 9jFsyh0DCOv1; Fri, 16 Oct 2020 16:59:21 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com
 (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 09F521280F52;
 Fri, 16 Oct 2020 16:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602892761;
 bh=DdzDBF5hxmylwSICP513biIU2ssqzxXVftcSL0yfUD8=;
 h=Subject:From:To:Cc:Date:From;
 b=d13qckcmp0cOmpe9/ZtJwrkz+bo9I/1cyZN2ewPBBlZTSS/XXN2RjOMDFCSjoogXB
 OeH53RvuBWh8WQaxCjdqIQPe4epn4rUuAVprrr9fBCO+Jh7cFVJ73xFPIuC8oT/qx3
 xxiw8YJgipmyW6bbB1waCCqkKcxsFNVVxdeeUPFE=
Message-ID: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
Subject: Clarification around the DCO
To: samba-technical@lists.samba.org
Date: Fri, 16 Oct 2020 16:59:20 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
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
From: James Bottomley via samba-technical <samba-technical@lists.samba.org>
Reply-To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Greg Kroah-Hartman <greg@kroah.com>, Mike Dolan <mike.dolan@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed the thread you had about Renaming the Samba DCO:

https://marc.info/?t=160278497300001

The kernel developers have spent nearly two decades trying to develop
and refine the DCO process so that any inbound=outbound project can use
it in place of a more formal signed contributor agreement.  When you
introduce a novel legal concept like this, the key to getting it to
work is to have broad unanimity about what you're doing and why ... in
the case of the DCO this is what the DCO actually says and what Signed-
off-by: means.  To that end we've invested a lot of effort in trying to
prevent DCO fragmentation, which is why the licence of the current DCO
says

   Everyone is permitted to copy and distribute verbatim copies of this
   license document, but changing it is not allowed.

Firstly, in the above thread there was some confusion about who could
use the name DCO with a lot of other projects being cited.  Every other
project you referred to is an unmodified DCO user and thus is fully
entitled to use the name DCO as well ... we encourage this unmodified
reuse to keep a unitary DCO ecosystem and spread its utility to other
projects.  However, since Samba modified the DCO, you don't fall into
this category.

Secondly, Bradley dug up an older version of the DCO which had this
licence

   The Developer's Certificate of Origin 1.0 is licensed under a
   Creative Commons Attribution-ShareAlike 2.5 License. If you modify
   you must use a name or title distinguishable from "Developer's
   Certificate of Origin" or "DCO" or any confusingly similar name.

So if you want to keep your modified version you may, provided you
endeavor to respect that condition of not having a similar name.

We'd also be very interested in bringing Samba back into the
fold of projects using unmodified DCOs.  We now have 17 years of
operating experience and for every other modification request (and
there have been many) we've always found a way to add the needed
clarity to the licence of the file instead of the DCO, so we really
think we could help you make this work for Samba as well.  It would be
really great if we could work together to do this because Samba is the
last outlier using a modified DCO and with it brought inside the fold
we'd have a unified front against the various CA/CLA abuses
corporations try from time to time.

Regards,

James

[I'm assuming everyone on the above thread reads this list rather than
trying to unmangle the marc email addresses to add them to the cc, if
they don't, please feel free to forward this email]



