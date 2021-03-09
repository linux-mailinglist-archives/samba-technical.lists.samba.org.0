Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA34331B60
	for <lists+samba-technical@lfdr.de>; Tue,  9 Mar 2021 01:06:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1dqCVTG2109HqZ5qitjhQym98S7SrqCwUMAJTjbj+9Y=; b=KKPdrKifgVWKDXURBbMpPqKUpe
	my9OYJUrZ7i7V3bacclUnPc+bW67ggqFT8mglprXOMUVnJmTtvGDIcz50e5ytllA4zEX78+RHxznz
	yGn3XkUycjxTquloi1KqH5oNTGcjFwtdRjYgWDeKhBgoW4NPRET195nVQJQBzT03d/sSlhpG8LXzO
	PehbOyBDVWTdnDety4gc8yLmOdFKeP6SBlWBBORx7VGwgEYjfdMZmRwto695WO+7YlZuUdQ8cuRtb
	DEJUEk7XAe8qmHVdMWMogQ7C43k67nleHWvAyryaLaS33Ax0whBV9CiGBAbowoywI1vInJw5u9rez
	OrFYIkWw==;
Received: from ip6-localhost ([::1]:63206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJPsS-004YxF-EK; Tue, 09 Mar 2021 00:05:32 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:35688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJPsL-004Yx7-KJ
 for samba-technical@lists.samba.org; Tue, 09 Mar 2021 00:05:28 +0000
Received: by mail-io1-xd34.google.com with SMTP id g27so12014070iox.2
 for <samba-technical@lists.samba.org>; Mon, 08 Mar 2021 16:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1dqCVTG2109HqZ5qitjhQym98S7SrqCwUMAJTjbj+9Y=;
 b=UEihR8CrE4FeNvT2OdS7bRAfFJCmRPsb30Kiepa47DNk2DE7zZbdu+v6dLRCJfRBCO
 oRwRvLNClbJaUy5/ecqwuAWxT5sW1ijnnlfn2osB6d9V7I6PD5SClj98hqqAlzk0YiTi
 Kz8NkwSO1Ts26CcybddV9OyUWdDndv3VPBlFEkusMyTOyW5Skb17fmNoWrNThK3nNtcY
 WhCy8NNJIy7prx5fKzFWuoBkcJCn0Thh6PTC8bGOP8LmKZBsglQXDo9LiIv5DLP5uxLY
 AefbjUIWHSznFSoHWpa9nSdJJg/siTERIO7DByP+cOdkVI1O3d27tCAyQMvWO5IvfdGA
 GQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1dqCVTG2109HqZ5qitjhQym98S7SrqCwUMAJTjbj+9Y=;
 b=npZxt7GPj7F+AzaNL9p8MUYKJN1zdguiBdRBQt6zphTv8v4aeXlbUWiyAsw+SczXL2
 lmaiYi9Z/7Dv7jq2ORVn+2fZIrJ3lBUw0raL1+49wFGCnSlDdUxVPBrNAvDrLtU4NJA+
 CU2UnfO3r3Ff5hSnkP+oZeceEJ8/Yvhg0Svoruh4zZ+GkmQXeLuGdPOEMoinmze/yCh1
 DC154P3t4E7MN+X7J0P0ydhBQpHltz5iEQDvz76jaLfBYI5DJilwZ6ddmeFf4Vh4oA8r
 wLJsBD0JMMGvPSI78oxBfJMg7IxsoiHZ8+LZcZ7t8uGGU75iygwfshKy/9sKGf0RPC26
 bb7g==
X-Gm-Message-State: AOAM5310ef/sk6xcSJ5XtU0ESAEsVdZRI0dLqHRttP8gdbKkOLCN4Pu4
 IFSspev7bljF5zQyTxwy0kaMBdbCb599qvYN/W0=
X-Google-Smtp-Source: ABdhPJzTcYB5yot0LrZe6zznt36hN//F09p3og4Ka+6TY2XhELvZ9Za8LU1mTe1TUZ6Z4d31CE/oMDyplA5k2K9kA9w=
X-Received: by 2002:a02:9042:: with SMTP id y2mr26340053jaf.94.1615248322889; 
 Mon, 08 Mar 2021 16:05:22 -0800 (PST)
MIME-Version: 1.0
References: <20210305094107.13743-1-vincent.whitchurch@axis.com>
 <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
In-Reply-To: <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
Date: Tue, 9 Mar 2021 10:05:11 +1000
Message-ID: <CAN05THQtb5RY2ye7nkyWBjrXS+=usZCxUM7jBQG+JEpg_TQQTA@mail.gmail.com>
Subject: Re: [PATCH] CIFS: Prevent error log on spurious oplock break
To: Shyam Prasad N <nspmangalore@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel@axis.com, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Mar 7, 2021 at 8:52 PM Shyam Prasad N via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Vincent,
>
> The reason for rejecting the request maybe a number of things like:
> corrupted request, stale request (for some old session), or for a
> wrong handle.
> I don't think we should treat any of these cases as a success.

I agree with Shyam here.
We shouldn't change the return value to pretend success just to
suppress a warning.

However, if it is common to trigger with false positives we might want
to something to prevent it from
spamming the logs.
These messages could be useful if we encounter bugs in our leasing
code, or bugs in server
lease code, so we should't throw them away completely. But if false
positives are common ...

Some thoughts I and Stever brainstormed about could be to change the code in the
demiltiplex thread where we currently dump the packets that were "invalid"
to maybe:
*  log once as VFS and then log any future ones as FYI
* log once as VFS and then only make the others available via dynamic
trace points
* rate limit it so we only log it once every n minutes?  (this is overkill?)



>
> Also, from the MS-SMB2 documentation:
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/4f35576a-6f3b-40f0-a832-1c30b0afccb3
>
> "The client MUST locate the file in the GlobalFileTable using the
> LeaseKey in the Lease Break Notification. If a file is not found, no
> further processing is required."
>
> So I don't think we should be changing the logic here.
> If SMB v1 had a different behaviour, we should check if that is as per
> the protocol documentation. If not, change it.
>
> Regards,
> Shyam
>
> On Fri, Mar 5, 2021 at 3:12 PM Vincent Whitchurch
> <vincent.whitchurch@axis.com> wrote:
> >
> > The SMB1 version of ->is_oplock_break() returns true even if the FileId
> > is not found, as long as the oplock break notification message structure
> > itself appears to be valid.  A true return value makes
> > cifs_demultiplex_thread() to not print an error message for such
> > packets.
> >
> > However, the SMB2 version returns false in such cases, leading to an
> > error "No task to wake, unknown frame received!" followed by a hexdump
> > of the packet header being printed by cifs_demultiplex_thread().
> >
> > Note that before commit fa9c2362497fbd64788063288d ("CIFS: Fix SMB2
> > oplock break processing"), SMB2 also returned true for the case where a
> > connection was found but the FileId was not, but it's not clear to me if
> > that commit really intended to change the behaviour of the error prints.
> >
> > Change the behaviour of SMB2 to be the same as SMB1 and avoid the error
> > messages for these packets which we ignore as per the spec.
> >
> > Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> > ---
> >  fs/cifs/smb2misc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> > index 60d4bd1eae2b..3ea3bda64083 100644
> > --- a/fs/cifs/smb2misc.c
> > +++ b/fs/cifs/smb2misc.c
> > @@ -679,7 +679,7 @@ smb2_is_valid_lease_break(char *buffer)
> >         }
> >         spin_unlock(&cifs_tcp_ses_lock);
> >         cifs_dbg(FYI, "Can not process lease break - no lease matched\n");
> > -       return false;
> > +       return true;
> >  }
> >
> >  bool
> > @@ -755,7 +755,7 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
> >         }
> >         spin_unlock(&cifs_tcp_ses_lock);
> >         cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
> > -       return false;
> > +       return true;
> >  }
> >
> >  void
> > --
> > 2.28.0
> >
>
>
> --
> Regards,
> Shyam
>

