Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC333002B
	for <lists+samba-technical@lfdr.de>; Sun,  7 Mar 2021 11:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VuSNp8ohCEDTVNqOLRIMNo7zaXhyGLF+pvmM+1TvWQg=; b=M1VVVESNHbPTzZbdnMkDopyizD
	bO9l6rNmCyn3RRTABxDxRwbDUNvhPT+6dslfadwNCKxul+QcchLixBBR5rFYPXwXwFqoBusIf7ATV
	x1cLM7iNpwbPrkEEmZxYWUw+C1B4fkPZjy0RzodFLiVoRIyjpR/VjtLP7BaRBvnwq6LBrwPTOKvj9
	RQtzK31XY1UjjYWiFIMq6P0khGKSLSVAO74+daI4vyLorT2TKyv3cSP/AzRbLMONqCSK2odY5MZBk
	S2ry0vaIJpTeI5yLEQp+fsvzSdW33tMLgLRC82BgKksqooqnwFe9YRj9AUvsyKnY3tCIhJ5Pn2dvx
	oCibkcuQ==;
Received: from ip6-localhost ([::1]:24572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lIqzl-004RDk-IM; Sun, 07 Mar 2021 10:50:45 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:33354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lIqzX-004RDd-NM
 for samba-technical@lists.samba.org; Sun, 07 Mar 2021 10:50:37 +0000
Received: by mail-yb1-xb32.google.com with SMTP id x19so7067339ybe.0
 for <samba-technical@lists.samba.org>; Sun, 07 Mar 2021 02:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VuSNp8ohCEDTVNqOLRIMNo7zaXhyGLF+pvmM+1TvWQg=;
 b=g2GpQyn+lSSG941waxTRsJNyYVrlP+w4Z1byHE6B11GbHqF1ij4Bg+3I5KpB4EDgnJ
 B1tgnEyQS9XTafRwNoYit2OUoYikss0E8qxrfxoHpQn1gFLoPve9mA1vQG7k4sIXfIrg
 P61/iE60aSupZHVQvUlJI9Ur+a0QKCnV15iGyjV1Jha5drAiZCIpkdli9fNG26Fb94Xa
 QXHsELSumBNe2xMCPUo+8P8WiR3q3pLFbzeEGiFA81GG3iYBYHQ+1ba7iqWZxCvIT1FL
 Q3590rHIW6CDAtURAlGI2zF9VoDzbk0mSxIwoR5Yj+/qZkvE1CdBeKlLz31zLzom+1Fq
 vE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VuSNp8ohCEDTVNqOLRIMNo7zaXhyGLF+pvmM+1TvWQg=;
 b=NBQZ7N3+Lblj358F6BJrUKixY0PJJ4OtimcbyQMqVC/1WuB9X1pNUhjODhBcSPqwh8
 V6Bmp/V6ErBtUgs1bNvlA0N5mm+ALVUrfaXSufUjAgfzMEOhgHsxNrhT/3tIbsJJi3Df
 8B0zdKyZFyrGzmJKQWRF2ZaCz7NDNaejqGAbdx+jaPYvQzQ/Op7R6HLSeic3KmHIOdzP
 1rmq5RPb6GV4rzRPi9jpYnJ7vLMHjD2gxAuKGpHX4nJPvH5E+TV5wr04Yo84uxZrtHiN
 K7wcnGvQHY3jRiutusJeAGeT5Czs8kT8pbJqtoKca8ls+nVKgQZ/Kc9Kfua8SjTsmu1g
 phAg==
X-Gm-Message-State: AOAM5303JZoua3q642XzY1jGePbCLzEFbldFFte9+0pWp//3DZ94Yane
 hZ5Gx7AX1KtN4khPhLRuekAdd4FDe+Xq5w0FKno=
X-Google-Smtp-Source: ABdhPJxMe+8aOlcrc2X9rehsYaYuitly26CDn6yA8BqexdDs5ZwoiRRL4LwO3ovwBuua1q6WRcnqBSheWy4yYWrWaK0=
X-Received: by 2002:a25:ab82:: with SMTP id v2mr26092512ybi.97.1615114229379; 
 Sun, 07 Mar 2021 02:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20210305094107.13743-1-vincent.whitchurch@axis.com>
In-Reply-To: <20210305094107.13743-1-vincent.whitchurch@axis.com>
Date: Sun, 7 Mar 2021 16:20:18 +0530
Message-ID: <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
Subject: Re: [PATCH] CIFS: Prevent error log on spurious oplock break
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel@axis.com, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Vincent,

The reason for rejecting the request maybe a number of things like:
corrupted request, stale request (for some old session), or for a
wrong handle.
I don't think we should treat any of these cases as a success.

Also, from the MS-SMB2 documentation:
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/4f35576a-6f3b-40f0-a832-1c30b0afccb3

"The client MUST locate the file in the GlobalFileTable using the
LeaseKey in the Lease Break Notification. If a file is not found, no
further processing is required."

So I don't think we should be changing the logic here.
If SMB v1 had a different behaviour, we should check if that is as per
the protocol documentation. If not, change it.

Regards,
Shyam

On Fri, Mar 5, 2021 at 3:12 PM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> The SMB1 version of ->is_oplock_break() returns true even if the FileId
> is not found, as long as the oplock break notification message structure
> itself appears to be valid.  A true return value makes
> cifs_demultiplex_thread() to not print an error message for such
> packets.
>
> However, the SMB2 version returns false in such cases, leading to an
> error "No task to wake, unknown frame received!" followed by a hexdump
> of the packet header being printed by cifs_demultiplex_thread().
>
> Note that before commit fa9c2362497fbd64788063288d ("CIFS: Fix SMB2
> oplock break processing"), SMB2 also returned true for the case where a
> connection was found but the FileId was not, but it's not clear to me if
> that commit really intended to change the behaviour of the error prints.
>
> Change the behaviour of SMB2 to be the same as SMB1 and avoid the error
> messages for these packets which we ignore as per the spec.
>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  fs/cifs/smb2misc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> index 60d4bd1eae2b..3ea3bda64083 100644
> --- a/fs/cifs/smb2misc.c
> +++ b/fs/cifs/smb2misc.c
> @@ -679,7 +679,7 @@ smb2_is_valid_lease_break(char *buffer)
>         }
>         spin_unlock(&cifs_tcp_ses_lock);
>         cifs_dbg(FYI, "Can not process lease break - no lease matched\n");
> -       return false;
> +       return true;
>  }
>
>  bool
> @@ -755,7 +755,7 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>         }
>         spin_unlock(&cifs_tcp_ses_lock);
>         cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
> -       return false;
> +       return true;
>  }
>
>  void
> --
> 2.28.0
>


-- 
Regards,
Shyam

