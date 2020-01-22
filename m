Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA957145F07
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2020 00:15:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Kq2IP1hIGuKFw/G8CqaH+hWfQgqsWkoIbXt/bd1XL0Q=; b=PwURi9lIUXMDIWsdV+89jIm/tt
	5JsfUnCSM4tUSBryOSnUcmQolJLLLwH6kW1UzynpKW2lmeqjVbxXTgr4MO41v4bvA4g5aHMJX/Qhe
	Rlvi1UXeqdgMoKM9sOHowe12gK8JMceEE73XeUa1T/Jlvj0EzIfODj2zKbZqJ2USlZjEL7oSU7w9f
	QHD0Mt4lJjGb4jFdNoYFk7yRWT9HI59d/V9amZqbArVK2AiYRY1jrHU3vTzSpNQy9AJ9Z+4BvLb8E
	gEu9xLam8gQXJCjcthl+chPe+g2lP6NFyzqHpGpWDl7XnHcxcvVwUsJPtdm91PBiQb4Wx4E/dNIxP
	xI7Qi5KA==;
Received: from localhost ([::1]:23230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iuPCN-004I3l-EY; Wed, 22 Jan 2020 23:14:11 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:37683) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iuPCI-004I3e-60
 for samba-technical@lists.samba.org; Wed, 22 Jan 2020 23:14:09 +0000
Received: by mail-il1-x132.google.com with SMTP id t8so742567iln.4
 for <samba-technical@lists.samba.org>; Wed, 22 Jan 2020 15:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Kq2IP1hIGuKFw/G8CqaH+hWfQgqsWkoIbXt/bd1XL0Q=;
 b=ktVitgYhBUqR8NzwkRgAs3yeevVeyIhhQcQ82fIVplKqd/mb01nWRf2d1nvzz646iZ
 DTLUqFRXvzB9/IytlnDBWkg9/ilZDlg03hXfWSxLoTbu1jKEuGPtkIu+QGb4+8qYNVtX
 m249WvyimAlaKq4S/Luz+llPW1lhVCn5znaijYjYl0hFyDWHMAZRu/QQQ5nJnjFfu+Py
 tRaxDAndT7EFds/wJaviZrMcoAbjgvkWQyszpvwmZAMgPKzR3VtXH+hMaUEJsdZ0nDqn
 NKypOP2+DM5n9eiwujFqiB27LBO6f6r8fhEU+wKa/ZnVC09BAhxQ354NO7XI9eNpOQxn
 0CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Kq2IP1hIGuKFw/G8CqaH+hWfQgqsWkoIbXt/bd1XL0Q=;
 b=dE/rlNXgPw0D2HDSSi6579YJFiFaVrUICMH98oOf3wiou5rj2hOpeuXxzufJ59Zc6I
 t8kTDa/o7tue2R4VatNQ4bpMAInq6UDenIY6KFg55+GOgc+16rwf+fby2hcta7xZ1jY1
 aaiqSXJIjqt/nTbuSIroj7/XzQZ5FtydWnPiB3QH/YTLnwiDRJnX6vQPZe/vy7r+ivZh
 LNf3mUFoPQ6q3IHCFX7CNgsm+zc7sIaMjUHnxGD6g79ZuwbZCJu3adAJB9bP3yTvID3U
 zGqwtP0Idq0DdYIK3nVSR23IthfkhWlvBFImtJAtckgjgAAApwpjL5jKt7p+GCq73F9H
 vtBA==
X-Gm-Message-State: APjAAAXXXPEPFyeQxpYGQ5vMS0EeFD8UoNwUNhp/hbXkS8AuAvuQX+yZ
 HtSvsr48+Y6KJ4+PmAY006wPwQyFXHIife2jAPE=
X-Google-Smtp-Source: APXvYqzLAqRau6zdAqo/jrMCBTejWOPbgKpEV7QlBIuCkdLF1bAb7z5hojjPYoKPzq8i9RZOqIvIo270Em3XX7utEc0=
X-Received: by 2002:a92:9a90:: with SMTP id c16mr10104878ill.3.1579734844056; 
 Wed, 22 Jan 2020 15:14:04 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 22 Jan 2020 17:13:53 -0600
Message-ID: <CAH2r5mvYTimXUfJB+p0mvYV3jAR1u5G4F3m+OqA_5jKiLhVE8A@mail.gmail.com>
Subject: [LSF/MM/BPF TOPIC] Enhancing Linux Copy Performance and Function and
 improving backup scenarios
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, lsf-pc@lists.linux-foundation.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

As discussed last year:

Current Linux copy tools have various problems compared to other
platforms - small I/O sizes (and most don't allow it to be
configured), lack of parallel I/O for multi-file copies, inability to
reduce metadata updates by setting file size first, lack of cross
mount (to the same file system) copy optimizations, limited ability to
handle the wide variety of server side copy (and copy offload)
mechanisms and error handling problems.   And copy tools rely less on
the kernel file system (vs. code in the user space tool) in Linux than
would be expected, in order to determine which optimizations to use.

But some progress has been made since last year's summit, with new
copy tools being released and improvements to some of the kernel file
systems, and also some additional feedback on lwn and on the mailing
lists.  In addition these discussions have prompted additional
feedback on how to improve file backup/restore scenarios (e.g. to
mounts to the cloud from local Linux systems) which require preserving
more timestamps, ACLs and metadata, and preserving them efficiently.

Let's continue our discussions from last year, and see how we can move
forward on improving the performance and function of Linux fs
(including the VFS and user space tools) for various backup, restore
and copy scenarios operations.

