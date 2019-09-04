Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12513A7CAB
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 09:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=czc7nEzhPBWVAILaYzFkSqGEx1pif7ede7wY1jWBV9Q=; b=nZUJz7YbcbVqFEyYY76zmDt4YQ
	QuEGSoTvicwMKtmft8P5/Mgar8NAaCHd42eDzi0TSZTw9GOYBPq3S+zdSW3H7v7yYprO4K9gt88Vj
	ADPoPw2egaaXLikMtZDPgl+Xx9K20n8FFaotp7fT8AFs1w9XJByrTd/IR4lf2XPOXVwWzHhfxkpip
	NAztmCqnHmKmtQJXc1/rxXpTkoWP+a80egkHwmmIv8oVPpedVoSPPwKBF5IL5N5rxzpxCaw+c8TdE
	y0D1N4CUUnHB4tuuLQ6FzhzRC6CgrsmN4t0EmaVnXtPVXPidBlIqxLRUjtR5sZxSRIjo45Ly7X8HI
	WLKUlsYw==;
Received: from localhost ([::1]:35518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5PbK-003KG4-0Y; Wed, 04 Sep 2019 07:21:10 +0000
Received: from mx1.redhat.com ([209.132.183.28]:58196) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i5PbE-003KF6-MP
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 07:21:07 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF4988553A
 for <samba-technical@lists.samba.org>; Wed,  4 Sep 2019 07:21:00 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id s24so10646672edx.6
 for <samba-technical@lists.samba.org>; Wed, 04 Sep 2019 00:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=czc7nEzhPBWVAILaYzFkSqGEx1pif7ede7wY1jWBV9Q=;
 b=eMxKD8zZkrgTQlVWE780hSwuvBDZtUmJl/5/P9SexHmghremejF3gXNgrkx4QoB5iM
 ii1MBPRRyYHDWnsses53zh/NkXmd5x2IP2ME7aXl9ymGO3sdd2PCWS03tHoxvqpN93PX
 9IWufbPPqeh0W1PNO2ijl/JWcBWHJXqBF3apyWhDRY1ETqwAVx3qVkEa1xUyvq/ywQHr
 KyGVnwM+tXyX+Zdd/PmbQOlSGGmDvfvohRqg1apltdinJh4SQ95GTsezzk/iA4oG3pUc
 lCloUOFSBf2WEbekHKmDXu3pASEWsurevVtGtAiAFVj+mNUSRWvhAg5IFLIxhFD2mLfp
 h2cg==
X-Gm-Message-State: APjAAAXETsMZZMTC83JHUIhwAgSUoEJY+q7laGUDW25zA4H/uigmBG2y
 kE9OLdN2YVsG69p6jh+hYszslX/tufHXluGTojXJbmdg0RVg4NcdJ+wX81MXln6TIjAkOmVsoLH
 q75Oj+VX1TPbpEezbYv8q3QaCY7FpjqD1R5FA5lokqzj3
X-Received: by 2002:a05:6402:1594:: with SMTP id
 c20mr40040518edv.130.1567581659340; 
 Wed, 04 Sep 2019 00:20:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4o4PtKWz/5t7c1HW3W3gOUFs+CDTM6T1HVkw0QLBFJGZGPcHzuocK/NZfG1rC/IBAI4o7RQIjW7MiONbLJLM=
X-Received: by 2002:a05:6402:1594:: with SMTP id
 c20mr40040510edv.130.1567581659246; 
 Wed, 04 Sep 2019 00:20:59 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 Sep 2019 09:20:48 +0200
Message-ID: <CAEiGmBL_1J4CBtKRcqx8JpSMTpMKFA6L6kBYpYYGsdXRXsfPaQ@mail.gmail.com>
Subject: Test script test_net_ads.sh can't fail
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I've submitted wip MR #765 and while working on a test, I realized it
doesn't fail when it should, right after the first call to testit(),
see:
https://gitlab.com/samba-team/samba/merge_requests/765/diffs?commit_id=28f588b18c2f13c217d958914d8cbcc0c4a7368b

Any clues on this?

Thanks,
Isaac

