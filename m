Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC2B94817
	for <lists+samba-technical@lfdr.de>; Tue, 23 Sep 2025 08:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YSJpZRWShZYdWJjKLkn5qLlPYX9DFVomlVABCKCNQ6Y=; b=jYJoJsZ3A2MkjmKN0MdVomE0au
	zYd9qFujPO1km9zJvLl3WgS7H7aTQBfygKWNVHaUb8y2gONC3xoztrdMTGD7+cQspHGolgzNvhC34
	K1wmma8RiU3llfBKXedwjrpgF+6XiG2++zAxOh4ZgH3qFyB3A+SHAVnJQs47kFWJww6w2sfVrMctC
	q5+hTjEHjrTYJMZbEO6B1SQ6FQ0vfkX/HPLnJpZO2NklEJqeVP2uj7wNX9wZ+JeelyvTa+YUplKDd
	+1b2OAniHz4T9n3QHcqR+Q/eYN9lv2QJuYsnU7D1JDpQzjwh+BxosARdbeCMH/OcKH0mEpGToEznL
	LJWYKJXw==;
Received: from ip6-localhost ([::1]:31882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0wCm-004ai7-Mo; Tue, 23 Sep 2025 06:08:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:59722) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0wCh-004ai0-G3
 for samba-technical@lists.samba.org; Tue, 23 Sep 2025 06:08:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-27c369f898fso9067725ad.3
 for <samba-technical@lists.samba.org>; Mon, 22 Sep 2025 23:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758607721; x=1759212521; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YSJpZRWShZYdWJjKLkn5qLlPYX9DFVomlVABCKCNQ6Y=;
 b=XjYTfJU+pewxWI7tAfGsV2+z+Cv2XgjwiJPvIwyd/6NviZy0kB33scabVLq33Cul1X
 PKgCZ4ExM+IbOl/cWof7iNY8dLdSNxdA0AQ3GH+x20JeqDeLRm8gLM5ZzP2B7+UDD4d8
 F/BCJiE2L+JYugV8ARVPESmgGhxZOFuz0ng0lNgtz5IJOWte+TOh3ZvtZNRSaIjp6Zka
 iqVL97wQbhGKpNX+V9nOslD+V3mXR79uh50cdyh8tp3NSYQ21d1jiNhSovULTVlaD97l
 wAvGrsA0FRtnypRJFqKYWRVZBmC7+Zk0ess/+G+ZhZRTDLlaUj195+fM6cUXBMVRHiiV
 0b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758607721; x=1759212521;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YSJpZRWShZYdWJjKLkn5qLlPYX9DFVomlVABCKCNQ6Y=;
 b=esn+ugLVwSKCfZ7HjDhuISQLqj9AO+oFA0+KXN65kTeoMvuov+uAThS+J8+MRaq4Eb
 thPe5mOtkFfQirSCfJ9s9QTk5U+UMjpe+W0CKZ54Plsqh/ROeihUZjBQdqaCaJ0eO9Ic
 gHUDTMmozzAVB11qcYjY/3IxfFARVpLrRLrxoFl/OmSOVUNE5z/DhyY8eE1zTgNtGoff
 ZDwlFVvUTlTPazsBj8Rui2h2M16XbA3dT5AXSMJM/68ObpKrGpgSb3LJ14uSc9AzLwNh
 iI7BLWtzKvP+70lEdojwwVEM0tXU9QElbh64tl3RL6lissL45NBSiC1zxu5KwTV0HQ9p
 uuxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA6ignfC/n3LE5ikdHDswlt02iViErQj8qtO+1rACC1+PfF4H9AGzWb9grQVtLtFehKmj4xm7E7kIhlI1Sc0w=@lists.samba.org
X-Gm-Message-State: AOJu0Yx4/WenoB2KCyt4OwUoUOsfaszxrorlW1UIEzRMoT0Djiv0mM5g
 I3Dmc+YeYzrg5RVquswW6UOrnLZUxEkE6ywUsI+j7IibiM0G3jxGQcUgBoFqgpg0JeH18MpxtOR
 6yClCxwXjMXamM0TjgQpYgTaMnjrvYDM=
X-Gm-Gg: ASbGncvcg5QPRn4NfduZTZLYRkZjEFn2WqItkmyBW4jpxgJ3gZhkvBLOykO66zcIjUT
 qokrpTdy3AgxcBJvxYC6S+jEJkmf9DE/HiaoRnLcrHIjdWzpBz8vEvTrcl1pv8LhEOinTjSxwEp
 M9aqZwCwxrYYP1yTXkJXXXer1ni3U7ajzztm/vK1P/USQoQ/xkr1PLTO3/t5YzRmz5cBkwuzPBy
 UZ3bwedDrWk2wn36Jep38gBvU7JT1jX+Z94dKyE5bUAEPC4dMyStwfVv+VKfcgGM8rk
X-Google-Smtp-Source: AGHT+IGRAq0rYZ+vlLINPHNAQPxXOf3yRO8y7qmNz775TXSSeWyxwazzxVZmC7YRTvEuzRQ3pMfTa/rzS+CXpy/3inw=
X-Received: by 2002:a17:902:ec8d:b0:266:272b:7277 with SMTP id
 d9443c01a7336-27cc846175bmr19823465ad.59.1758607720832; Mon, 22 Sep 2025
 23:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <80395.1758522267@warthog.procyon.org.uk>
 <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
 <12788.1758471560@warthog.procyon.org.uk>
 <98570.1758528576@warthog.procyon.org.uk>
 <101171.1758528778@warthog.procyon.org.uk>
 <CAN05THR3YQZ5sd7DOBo11kK=NaxFqr+X_fKjGt-8OXEkM4ShWw@mail.gmail.com>
 <184886.1758546497@warthog.procyon.org.uk>
In-Reply-To: <184886.1758546497@warthog.procyon.org.uk>
Date: Tue, 23 Sep 2025 16:08:29 +1000
X-Gm-Features: AS18NWCBMK6R15qYVyyfNmgRBR8g4TW8IZt-Fi139s2KzEnoH-YAsNKmqLwsw_I
Message-ID: <CAN05THTVkYHBvn37X56OC8-b53_h1OFF7aeyuM2522VfU_+2Tw@mail.gmail.com>
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

On Mon, 22 Sept 2025 at 23:08, David Howells <dhowells@redhat.com> wrote:
>
> ronnie sahlberg <ronniesahlberg@gmail.com> wrote:
>
> > Can you check that "Preferences/Protocols/SMB/Reassemble SMB
> > Transaction payload" is enabled?
>
> It is.
>
> > Packets 46,47,49 show up in the packet pane as "Trans2
> > response<unknown>"     I will fix this and remove the "<unknown>" tag.
>
> Actually, I think it is working.  The first packet shows a "Reassembled SMB
> (16234 bytes)" tab with the data in it.  It's just that the follow on packets
> say:
>
>         Subcommand: <UNKNOWN> since request packet wasn't seen
>
> > It should probably say "fragment" or something instead.
>
> Perhaps "fragment 4032-8065/16232"?

I have merged something like that now. It also shows a link in the
dissect pane for a fragment to the frame where the full reassembled
payload is dissected.
Thanks for the suggestion.
Let me know if there are other improvements you want to see in wireshark.

>
> David
>

