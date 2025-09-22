Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C42B8FC33
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 11:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7nJTol7nZRRKtUFIBlV8sKR2tTI8LvUnr1mfIEo30V8=; b=wwsQnPgUYxJVwfvQ5GSPY0k4xt
	ST4CBABOYGs2MyogegTjXTsJYRr9AG0JVaDuwi8GYXcLmxx0YQ5QPMX7VNncme8p8WDM3lgXrX//Z
	6QDdLI/FPf6kiFmjTmSLPD76JAHCVhgRnQlOWWZ0mAdV0MMFNRilFmR0Gk1pT5e14bC3lYRqhXq0+
	9G/UJy6I5q/+SpP21LroEY3TGv5qFQneNAG45hTexXfjgYc8KQF56ghEPJnUlqetTvPpeOzfm1EPv
	RIgDVWzArE+RM6wpsweKRo0C1+kQrkRnIr02mZgx27+d5cMIf6xIpsIJG0Nz0K1ikD/MJtDDPkDjP
	v04EwSKQ==;
Received: from ip6-localhost ([::1]:63164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0cub-004Wx7-BT; Mon, 22 Sep 2025 09:32:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:56623) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0cuV-004Wx0-U5
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 09:32:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2445805aa2eso42083445ad.1
 for <samba-technical@lists.samba.org>; Mon, 22 Sep 2025 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758533557; x=1759138357; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7nJTol7nZRRKtUFIBlV8sKR2tTI8LvUnr1mfIEo30V8=;
 b=NGbVDFK27oZloEHmnjkpj6IbZslpocYRsEO9NMwBeyB/aL6jN6piREohAEA40Fu1bw
 UXbSkM9POJPCcM1B+G2m/BnboCWGQnYnKopGd+g/DHJeediD4kk5XnCLsQ5ZD2KJF6bD
 F9VOIWMAVUML33lflelBEMWAlLz6+XITUdku28AHopd1ylE9wzfYzTJ/HQ5mq8TJd1io
 mI+j+SU9eSpQHRX3TF1ELS+wbUjKStDWCxvIBblc+DF83UmfPsQpULK2ElO/qLH5/+oY
 ovyMcyBI5H3pMPPZEjtHg/sKbYPASY8H9YIQEbWZmQpI9OZqn6VXE1CElaMh7U8MyiU5
 ZwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533557; x=1759138357;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7nJTol7nZRRKtUFIBlV8sKR2tTI8LvUnr1mfIEo30V8=;
 b=HVomJe6BT/Yp6ZHD9ibR2GM/XQiX0qMu4X3UmnOpHTM3hsWt4KrXFJCme/xw1ez2Fl
 4hrUDd3qFDgZ3xUy0KAtDYhhXKbreiUU6H8POW2XNpUIaOeF/SY3EOADzk4YRCJStGjJ
 oQBKzsSXq5KlvME7kjC1RL7Opp3WU6TBpB/BRkDhPZD9pqLOt+IQLFWuKOqDKLfENjSX
 Gk00JfIYkneFR2nkhAJ82FIdfW6Mkp5bCME4minmuhXNura2r59BKq7Kbikz8zdYgrmV
 hhS9LSAFET7lb9cwIxP2+nofKWcpJp260za04r8fYcTkKbsYI386hR5+XmusW9yEKAIC
 4DTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhh2AGs85Ky6jrs22cHfKH4ItoboaKjlR68FnrYX3/dmlF0cr/WK2H5tK3ZLgzIBbXKys/jJGCT+PxFf2ukhQ=@lists.samba.org
X-Gm-Message-State: AOJu0YzeFupSajWUuESn50FgZ5LY62UrYMOJcb75taY9FKyl1TfnpCdk
 fdXcMLza5lRGE1OCB+h5YIDfAji5zDPthdHtoiS0F1HtYKQa3l7DO6UREQc4YTmUeLbgOHRjE+1
 rRyZkULR99uwsNlvv3UaJmQkbfP2JCw0=
X-Gm-Gg: ASbGncvlBmkNMLKipYnrOOacyofZ9YzNrZSGO0bGTKkct+IFTZefoV+3zn1gQLTsVWv
 lDEcBcgEeLd6/M366tHThE3ydGWtUCCLqVeGt9ggKNEJUeB3Md2JJob5lpL3+W57yu6f1lkLxW5
 q3iitqBA++9Lzr9yYVHf5F0P9jF9DdGzjH8nS8xyUEBKJi265K4pmYecXSMDsL/y6mkfsEVi4Oi
 ZuvkuaxljkrCo5vDjGU9P5l5385efNspoGTR/wGUZMHP3D6KRURaGSFdPorY23eFLG6
X-Google-Smtp-Source: AGHT+IEjPiOXi3z+s8pNja4uDAW0nzxdwhqyTjWheD69t3NVqACrg07NHJTpxGokYa+LqqsdbASvkCpyiygifkgMMMc=
X-Received: by 2002:a17:902:db0c:b0:273:31fb:a872 with SMTP id
 d9443c01a7336-27331fbaaa9mr74729025ad.6.1758533557341; Mon, 22 Sep 2025
 02:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <80395.1758522267@warthog.procyon.org.uk>
 <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
 <12788.1758471560@warthog.procyon.org.uk>
 <98570.1758528576@warthog.procyon.org.uk>
 <101171.1758528778@warthog.procyon.org.uk>
In-Reply-To: <101171.1758528778@warthog.procyon.org.uk>
Date: Mon, 22 Sep 2025 19:32:26 +1000
X-Gm-Features: AS18NWCyTd3Ok25ccoToHtqyNwHAeL71-Ps1-3SnULIHZoO_hF1bCXljlpe9SfI
Message-ID: <CAN05THR3YQZ5sd7DOBo11kK=NaxFqr+X_fKjGt-8OXEkM4ShWw@mail.gmail.com>
Subject: Re: How to cause a multipart SMB1 Trans2 PDU to occur
To: David Howells <dhowells@redhat.com>
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
Cc: Steve French <sfrench@samba.org>, samba-technical@lists.samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 22 Sept 2025 at 18:13, David Howells via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Also wireshark doesn't handle the split buffers.

It should work.
Can you check that "Preferences/Protocols/SMB/Reassemble SMB
Transaction payload" is enabled?

There is reassembly of Transaction, Transaction2 and NT Transaction responses.
And for example packet #45 shows the reassembled Transaction2 response
built from data in packets 45,46,47,49.


Packets 46,47,49 show up in the packet pane as "Trans2
response<unknown>"     I will fix this and remove the "<unknown>" tag.
It should probably say "fragment" or something instead.

There is also no link to "packet reassembled in frame #45" in these
packets. There should always be a link in the fragments to the packet
where it is all reassembled, but apparently I must have forgotten to
add it. Was a long time ago.
I will fix that in the next few days and push to wireshark.
(In wireshark, the reassembled data usually show up in the packet that
contains the first fragment.  Or fragment offset == 0.   In tshark
the reassembled data is instead shown in the packet that contains the
final fragmnt that completes reassembly.  (Because tshark is single
pass and thus can not go back and re-dissect a previous packet.))


Ronnie Sahlberg

>
> David
>
>

