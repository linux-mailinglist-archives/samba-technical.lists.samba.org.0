Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11F5FFED
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 06:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zg662tuyp0AlQhB1auAgk5HIGCqqqmX3oF3GFTiPieA=; b=lHdKYuZ+IfEkjghtM9BJfOzcbC
	syxlcONQG8H3nd4dVwSL0kMhwPreUqwwaetvAxYk/jzgDvr0n9rsMnlC0dL2blyr2vQUcV+Zyl48s
	QLMUQg3Kk+83OrB5FV1wUQhCVB/cGP7WzCZswhOni4IjS0SgeZFLN02mcoU1rlq9l3MM+Th6GTlhY
	vFNtIAR/eKIO902vJm63nAMvbt0jZbLJD1BeSejEVLC0J5siU4IfmKs7MXjp7Ex+kxhOyGZb+ShI4
	k0SlaHMiyP1jVdKH+bFYJGlauW6tHH0Pl1YcOAc6V9mEhY5tQC7KNBfI2w9d5g464v5XMZKbcEZLO
	hO7s1IrA==;
Received: from localhost ([::1]:20660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjFWN-005H6O-31; Fri, 05 Jul 2019 04:08:27 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjFWI-005H6H-Rp
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 04:08:24 +0000
Received: by mail-ot1-x335.google.com with SMTP id z23so7732050ote.13
 for <samba-technical@lists.samba.org>; Thu, 04 Jul 2019 21:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zg662tuyp0AlQhB1auAgk5HIGCqqqmX3oF3GFTiPieA=;
 b=XR8Bb4vZ/pZyyK0mzSJwoZze4b76Y/97Z3wFRun6y7N+7+SLPJSlIyHTid+7SdJNy0
 gUPbai5nolRMmsgg0mUU5IGJE6pSi7KTM/5U3rii0SK2SFZ6gXmCBCCXu226AvpNg1Ca
 aJWRmGtU/R9hGFwusIwBssmSpG7sN1xRglXoaIiwnP9yZEsoKQWloeDQQ+lExRsbEBix
 cI9yS+1DEyv/wmu/KQWbgwiX+iYcYI9YYT8xv0Bhxulbgzr/hGkK3V1Pu4NGJtRZYtu1
 8V4/TKWwebb56Y9qLptO+1MrS/V7e3FNOaq5YOTTHTKc3ld/EJEEY3wuTnHLOZyJdNND
 YtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zg662tuyp0AlQhB1auAgk5HIGCqqqmX3oF3GFTiPieA=;
 b=XhlatyGXJckivLSrdQDe1X7wLm369ulqnN74jcp3pEVWEQIO7VVbW1Lt7OguvOb5sY
 xgQBQMNcnJN4YBMEr6g7nkpEtLM22aPFD2dvDAwpOLVnHKt6b/oVkjP873+H48gJM4ZZ
 2fB8bNCZEq+7ePY0zjv/aEpnnGHyWf7tpQstuvrzG8YqXJNkqREJ69FeDRBuoHwY+qVC
 v+7sR6Xb+68gYu/5FlMz8+fXllhr3cMD9JuwIPrw6qLy5E4jSBAvpeD83nxPlJGvkeCo
 EIcgNOOfHGsvpAUEAtmPg+1SV5rqUIYTxheIEgZFP4fUjQShDYbn3DLpewLx/eI09Vy9
 VYuw==
X-Gm-Message-State: APjAAAWmZndb1m0rcWNrDPQi9Jh7ILWfJC56ZvMkqdWESdAnkdKOsVKa
 p+BeslV6JnApFEmBGyrTya3cmsoAhuKng15QSYsg4A==
X-Google-Smtp-Source: APXvYqydtlRKtmK/ZaKlTdsY668yzNVmfJnPOV80W/quvLnOC3vBnTDYNbuZPR6HiQDX72GcfzfoxhZUStsQOHCnzZc=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr1177009otk.232.1562299701028; 
 Thu, 04 Jul 2019 21:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202823.2135cbb4@martins.ozlabs.org>
In-Reply-To: <20190702202823.2135cbb4@martins.ozlabs.org>
Date: Fri, 5 Jul 2019 14:08:09 +1000
Message-ID: <CAJ+X7mRzFt6sQQtVRKGj1UDfeTcTR_LFYEQ6jGnc0b6ZoS44ew@mail.gmail.com>
Subject: Re: [PATCH] ctdb-tests: Rename local-daemon.sh dump-logs to print-log
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 2, 2019 at 8:28 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> This makes it consistent with print-socket.
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

