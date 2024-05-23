Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C38CCC43
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2024 08:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vFzjZ5ldW2IMNMdsxBvmnC/oGknZ3A7UQZXsetPM+EU=; b=ffBTuFrXtC4ynx1GvKXSbWqlZm
	s9tsg+1owSUNbmf1HljbEgtenlSRiKkFcjJn/OKtld7uS9YqH48eeGBVEBaFsTd030sFon/H0+pTw
	m7300wRJQ/gUn5UnEmVT7FL0XGPbypLdhe7oQuBA76/0cDncD9JsoXHsQaE2Rf59TesekuarnVe8W
	n0VLYzrpb+w1RFSPRS72UVOQ3oR3Xf75GtC9PHrR4SYsmbyuJhzz+EvXMEdfkoyK2HocpVeKwh2Uh
	Fa98qNjE6Nt+GYikoGa4L4fkScIMvWzXcqcpUEBTbqvrlBgE/le5+JxnXQbqI3cA/tt/dXmwN9kz+
	/63RB8rg==;
Received: from ip6-localhost ([::1]:61568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sA1x7-009hsk-Rz; Thu, 23 May 2024 06:29:26 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44267) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sA1ww-009hsd-6J
 for samba-technical@lists.samba.org; Thu, 23 May 2024 06:29:18 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2bda9105902so1036907a91.0
 for <samba-technical@lists.samba.org>; Wed, 22 May 2024 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716445751; x=1717050551; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vFzjZ5ldW2IMNMdsxBvmnC/oGknZ3A7UQZXsetPM+EU=;
 b=MS2E+iNE9FqDcXPBENS3/bHb3N+QfA7jdAQTmjoRFpTw868VMGW4Oz0ebr2txdxCZv
 QYK6zZ4roSnDUtYZga08uMQv4Fz1VwlaHFBtC58Gt8gUAUj242tamfHg1XNsKHW8GcB+
 /sYvqNCMh344brtdlVc4Wi7+hj2ruZ7y+aXajtrcpFuEcAPJz1/tKY/MQjhJV2hbGSkj
 4VZMr63FMwrReDrKD/3I03SwNRqOnKrpTdSCJ0LZXvI7tsqtuBaIYOpp5p/hgl9+PIgU
 PqcGzb1DQ7H237jm7Vzhb1Nu1W90A7yuo95sdKQ+N9AktDxla9t5fV7MIXAnhIZ82+oo
 yTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716445751; x=1717050551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vFzjZ5ldW2IMNMdsxBvmnC/oGknZ3A7UQZXsetPM+EU=;
 b=GdKkd7OEM5A9yW0WSo8Y1MIzvpNZpakTmIlHQ8DNu0mdvBOAtNWtuBSWNlsyYxzOyq
 BTa/XWLossx0fk+rJQNArIri4aWBrApZDLRfUgQRhNNebQv6o8d8E+NffKLNj+ir7kmg
 D9ajOlSsqUE4TZGUSfKMVFsOqgMArcFtJYTknIE/SN5shY5CBqioBR+0o/uhsKiqSPsQ
 VXFy+Ozypp+dgacklMW24+T4CoJVSQ3gQWDiEaz7zufMnBPJZrlliB2xrG29qxxM8W48
 qh3C4sx2ie4Zlo7sLNBIF2h8595MTSWe0owZCEPm/MFfLDrq550fWPX9BV/LtGfc1E7G
 G8VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiTHAr0GdMWgfnWJe5tkrzHIOqC4uobJvpKzVDnMsZEVRjty7oNG6fjQPZG0nrFt14cYh0UL57XWOF3sKmpPKIxAMLUc+7zzzaajwonhWY
X-Gm-Message-State: AOJu0Yz+RUgMB9hn3hBelirx9pC6vcHSML397As3gUe3RGP/ztFgvsdB
 L49OeOei9HQvVVh7Vv+kNI5RL44cbmAFM+Cyzr52W564pCSj4S9A6Ydr1BeIHy+8pddooOAcGnj
 O5XH4hTnRG6mZYDq3FWW4WlkGrmU=
X-Google-Smtp-Source: AGHT+IEG1ejEK6Tf2x1fRgF3lG4AHSfZ5oPqECPkwNzx0zih63Oi6OONR9RYMiHk7P2qdpVWN0xMxf3Iz1ceWB2dIh8=
X-Received: by 2002:a17:90a:604f:b0:2bd:e076:8798 with SMTP id
 98e67ed59e1d1-2bde07687a6mr1009291a91.24.1716445751058; Wed, 22 May 2024
 23:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk> <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
In-Reply-To: <476489.1716445261@warthog.procyon.org.uk>
Date: Thu, 23 May 2024 16:28:59 +1000
Message-ID: <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 Steve French <sfrench@samba.org>, David Disseldorp <ddiss@samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 23 May 2024 at 16:21, David Howells <dhowells@redhat.com> wrote:
>
> ronnie sahlberg <ronniesahlberg@gmail.com> wrote:
>
> > On Thu, 23 May 2024 at 14:54, David Disseldorp <ddiss@samba.org> wrote:
> > It might be best to just ignore tests that fail in this area. And just
> > accept that some things, at best, is a best-effort approximation.
> > (as long as dataloss does not happen, of course. That is never acceptable)
> > At the end of the day it is a lot of guesswork and trying to fit a
> > square peg (unpredictable ntfs behavior) into a round hole (linux vfs
> > api).
>
> The problem is that it essentially renders SEEK_DATA/SEEK_HOLE unusable for
> applications on cifs.  If there's more than one extent above the starting
> position, they'll fail with EIO.  The only way to do it is to provide for a
> sufficiently large buffer to accommodate however many extents that there are
> (and there could be millions, in theory) in order to get just the first one.

Wait, I didn't read all the text in the initial posts correctly.
Do you mean if you ask for "max x bytes of response, enough for n
entries" then if there
are > n entries on the server you get nothing back?

I am pretty sure Windows will return as many entries as fits in the
reponse out-data-size
nad some error code.
But you are saying that instead of returning a truncated out-blob that
samba will return nothing?
I will test this tomorrow on a win16 server.



>
> David
>

