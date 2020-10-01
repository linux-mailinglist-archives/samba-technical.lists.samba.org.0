Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD7527FDF4
	for <lists+samba-technical@lfdr.de>; Thu,  1 Oct 2020 13:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LpSM+rRHzBSMytnDHL/DL9sUB5Qjfbqr4nyejqcrB+c=; b=0JwXYnxPsE6x2gbOhDFbiJQKWI
	4+TfxjZEUuJ0M6vavYt5GvIB1seirV0hPFR/L6w87zCspu9SszCk1migP/WHzl52CFYAD//1LykuX
	ohWYT5rB0g4xLzeCMXSOYS9sMZqtLXSRq77Rb9tUfTordQtfw2cFZj2QyO4Hy3tqTwcu/5t5g5PCE
	8V17zwl4FM95Urhve8JMsHfiHxJVBs+GM97dkkp1W/qvrSr8AFyPlcz89NzbqJkZONzPhbNEX77D1
	g8ZbQoZXeneRt0vzYi6p3P7TYLxyCMA0UlSIbLb91A9KggQ4SdV7UlwKhtLpfemoxxlqX/EPvNLEb
	+BR8YKEA==;
Received: from ip6-localhost ([::1]:61048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kNwJX-009ypf-PP; Thu, 01 Oct 2020 10:59:55 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34491) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kNwJT-009ypY-Ce
 for samba-technical@lists.samba.org; Thu, 01 Oct 2020 10:59:53 +0000
Received: by mail-yb1-xb33.google.com with SMTP id k18so3721503ybh.1
 for <samba-technical@lists.samba.org>; Thu, 01 Oct 2020 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LpSM+rRHzBSMytnDHL/DL9sUB5Qjfbqr4nyejqcrB+c=;
 b=VZJh5yq3z3gLFVpd0Yf5p4+7MycS0zi4PMhMfXI3FB+7dZESFI06Q2G+uDEGQwQajK
 MfsNN50B/L7rOY9DjOng5/vpvp8v2GCVKh/0LpfWtbliSmUOoFpJPQQMQh+Vuv1gSstS
 Iccii4h0aprQbkEnbTcyUm4+Ob/SMf/Jeyh3UE1pPyDMPKykmHWRaYs7udZHgZn6HSzd
 bZ1eoYhbE6QFZWoI2JxE+d+BgrdP69bpwSfsrNr7KrENft6Qcm1j82jXOIkhJOZzH6V/
 2dNPhSaamoy+VmG9SboNfRLDJmdwEnSJ3EVAbPvhN4GHb3OyiukKc7klo6qfGwb3BI71
 wO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LpSM+rRHzBSMytnDHL/DL9sUB5Qjfbqr4nyejqcrB+c=;
 b=Nwc6AxIuDj7kOTOw998FXjRlG7Xtj5VrBLMD2zQWYYlDmgx1HDYgOgggeaidCYoo9j
 iwaua8wO2uYKxOoCCahMOsP/oUoeDXRQF7ODu4ROmel3BVjnLDr6kXNkrx3GT0G1Jc8u
 HcB36OyjibS/lXo7sxrMrEVlunnA+UFJ3xPrZLLnC+bsn7rJb9OhjX2eX1iJVJA2igUE
 rCBKN784lICPok8ZGHzk+cy4mP5+PloV+V/1yAtgKs5BbckqinBZo22EirxK3rPBR7qr
 wYYQAU7JCNMz4vi5fIVidsPruzp1nOC2S3WY5Ipd8ABdZNcbfHNDmdn2PIz9dDL/U9+w
 91mw==
X-Gm-Message-State: AOAM530K3uKQ3Kjpdih0eLijVujUAS9PqKkHWJUvxFhywrMj0g10br0/
 ZNlCkNf53nGOu1cwd5Fktt3LpXPySItT20kJDZw=
X-Google-Smtp-Source: ABdhPJx+Fm1IxjpqGApvBxBebNU8xs+4bb9LigpNro1rr8EhL6ZnhZ3epWf3lYedURNU+DD/Ny+oBRAOdujvgn/pN/0=
X-Received: by 2002:a05:6902:1025:: with SMTP id
 x5mr9013881ybt.131.1601549988523; 
 Thu, 01 Oct 2020 03:59:48 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 1 Oct 2020 16:29:38 +0530
Message-ID: <CANT5p=pvumVCNCLbSCaxgmfFLR-ifeQJrUETfG4ALxzfTRRxew@mail.gmail.com>
Subject: Error codes for VFS calls
To: linux-fsdevel@vger.kernel.org, David Howells <dhowells@redhat.com>, 
 samba-technical@lists.samba.org
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Steve French <smfrench@gmail.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi developers,

I seek your opinions about the error codes returned by the Linux
filesystem for the I/Os triggered by users. In general, each VFS
system call (open, read, write, close, stat) man page defines a
limited set of error codes returned by the call, and the meaning of
the error, in the context of that call.

But in many cases, especially in network based filesystems, this
limited set of error codes may not be sufficient to indicate the exact
problem to the user. For example, in case of SMB3, where things like
authentication or actual mount of the filesystem may be delayed to the
point of first I/O by the specific user on the mount point, having a
limited set of error codes could end up confusing the user, and not
indicate the actual error to the user.

So my questions here:
1. Should the error codes be specific to the filesystem in question,
and not just specific to the VFS system call?
2. Do we have any other mechanism of returning a custom error message
to the user (the one that tells the user about the exact problem in
more detail), other than to print this in the logs?

-- 
-Shyam

