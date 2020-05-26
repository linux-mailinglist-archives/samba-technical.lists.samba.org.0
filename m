Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14D1E1D76
	for <lists+samba-technical@lfdr.de>; Tue, 26 May 2020 10:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JXW37Cc0jlrRD9Zt93Y3zIIt5TpBdVPRJf8vtytxyjA=; b=DCIjKF09xtPKcu4Oy3cBeEmLsJ
	ngsdcVaFIVcOGqyBdxKf2fg6B03fHrbVDb/ZhJ7OGIOOAwhlptBt8nC/U/fFi8Go1JUSQbR4HZllN
	P4VUC0SIla+fx1NCxawxRMjhqVGsU6BzBevyCytJC2GowEyIqjqbsXKONr1sCkYQs5XanQWyFaqE4
	xTvRvO2uYO/ATj6chg0Ejhr6H1U2xKxFdWjsOoIj12kuZ/WjD61L7TBnZsgnLJhf34d14AqZ8VpmI
	MZZnevm5kPCcC3Z24E8rZlXKzqzloUyTz56j7os3AwJ3v72ixOX3I+DAleQ45G3WA95dC3yqkOnu1
	03VxvG1w==;
Received: from localhost ([::1]:50564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdV5v-005v7V-8a; Tue, 26 May 2020 08:37:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdV5k-005v7O-P0
 for samba-technical@lists.samba.org; Tue, 26 May 2020 08:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=JXW37Cc0jlrRD9Zt93Y3zIIt5TpBdVPRJf8vtytxyjA=; b=mKSX0f4sQa+KfGOrejTEMtdibD
 NL+iL7R5ixlagdBVEM8uPsvfhvTT704HHow94RbtMpi0HwSHk66wJx7VEFyK87Vu80j83AlySue3x
 zsGwee6RMFIsY6fptMEThS2ZNEGH51jf0FtOuEI617e1bppWPfsgALlq3UEbHhCTgfCVZmwmu7WOd
 A7bGINHhblm+8Ir7UgfqWbN3f/rpY6rxE7sb+zAX5KWVW7bz2pQ2wLXwG9E9TZPzgJry+5hOMdbEd
 vvr851dJMt+xPBcLzAveL+teJQO4Cr9FcWNeZWxyrsgO532WUqzwdizNCjhSyqyupPKvlfFeaGWUL
 bZpD78D9GPjy2jJEt/cik0BsCZw7HXMRvakXoAcdHQDYDISE2Mnd6aFFDSWysBjJPueYrZvxG3D1H
 bIYbyO+TQCEx7l1uFPgdD1T2nIPY/SfyNuo4LtZRqYiGz9oEfvU0wNX+prqkWE/mxaCLnc37WQNFa
 zXn+cVBGKbuds5qCnRS/t7N7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdV5j-00017J-GL; Tue, 26 May 2020 08:37:44 +0000
Message-ID: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
Subject: Schema updates and modern Samba AD
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Tue, 26 May 2020 20:37:39 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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

(resend from samba.org address)

G'Day Metze!

A long time ago I remember asking if we could change the default for
"dsdb:schema updates allowed" to true, so that this is no longer
guarded in Samba.

At the time you said, from memory, that while schema loading was much
better than it has been in the past, there are still ways to break your
directory with new schema, so we can't change it quite yet.

What I can't remember (or find in the list archive) is what those
issues are!

Can you remind me?

I ask because I'm updating 
https://wiki.samba.org/index.php/Samba_AD_schema_extensions and I want
to include a practical guide to adding new schema, and make specific,
rather than generic 'here be dragons' warnings.

My hope is that this way we can encourage the use of appropriate schema
extensions, rather than ad-hoc re-use of other arbitrary attributes by
our administrators. 

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




