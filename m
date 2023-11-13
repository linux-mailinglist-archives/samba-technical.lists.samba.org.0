Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A66537E9C80
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 13:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=97plAS6Flkx13FPlUwWA6eRTOwIkZDSd/kCpQKDN1sw=; b=C2CbDZYtUj5oVhS2aQHt4iBefx
	PLNK/u65UE8MlutkzSa/ICTxxo7nGJOm+FdpJ35wTSeh0YiM0MybScihUG0mzMdN658kdcj6gwrZi
	e7bFJwOgOIUbFNPjBILV8T57wFtV3YXqagPdjqRM6s6uUXnto+qZu9JjiqdaEEyOrcDfQaJSFF2rB
	pq88YopWL65faddO4aHYJtv6LbiMAjQHxDU2fTyQCpUuFcIqVJkOHyL4B+8CzCfteB64uqNbQQ2cu
	JST7Xl1XTvWA8Bw1Avg1HZdxI6v4yaJHsXM+5+eAMFgNviY+PRtdwyk39vmAkvRAP19zRdAUsQOt0
	asq5BBHA==;
Received: from ip6-localhost ([::1]:59678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2WVY-007uCY-CH; Mon, 13 Nov 2023 12:57:40 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:51368) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2WVS-007uCM-AI; Mon, 13 Nov 2023 12:57:37 +0000
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5afbdbf3a19so50340657b3.2; 
 Mon, 13 Nov 2023 04:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699880252; x=1700485052; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+C/3/er/c7cCLGtAKrXrNpBsz1zXnqkE3c0dPw2jc7E=;
 b=ZqMoRxdqn2IVFpbU5I+PoCpkejHh3ZUOoa5zab7wy54pSfhksJXp1cqsV2kscfblP0
 jXhYaaL9hC3UOcCwrRSdsWjixzL/Y0WTlbchPy/pTnzlXaLfHAnuUWKy0xm3E4AH8WcI
 nVNYdei3SQ+FW2b4EL0jrChSJzI81Tc0hPLbE0Zkl2YOi9tgp/4BoIW8CvoQS0AxC/C8
 fe4hhpGI0M3qIFAlKiGWiUmb2+i4p6kvt2T7/I0a+lAXvYYwcKgLjlIxIzS2VJl0e8HC
 ttcv9kTgtvogSifObziuVoNSmLwWoAp4RFqWhW6Sy55cU9f3Q96q6CLEFT3D32nSEvMg
 d0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699880252; x=1700485052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+C/3/er/c7cCLGtAKrXrNpBsz1zXnqkE3c0dPw2jc7E=;
 b=Y1u1IlZ2dNdc8mr4CEa5xcsxS9iENU6v3oq+yqX5iWkJYDkN0u9k37K84LxGh/jERw
 Kbxx8lwUjWQuzjnqJVG2ytVYRcAWZG4T8t0zeUuqM24PZP4DGEaptwx6hMS3AKkKmH4a
 qrnhMNVpYK9nJv4suHRyMiWXMi/bTliITGei51F/zM2buG0no8dlFAi6dCabHTjPFE+K
 btnRzZHYSJ1Tj22+4Zi73i3b7KluTEGoHpLRJbyqjdstECQ3z+DTvn5xU6BusJMPYcYA
 ASTsgu/2N6H/WEr5nf2Quf2tnH53P0yPsPtvBX+FvYiU1M3JEb27P7AHneVr03+O777X
 SaSw==
X-Gm-Message-State: AOJu0YzbDkR9I6yV9Gph83FuexF54nyhpVGiUY7ed425W2NgKKqnFQcz
 EALvgpyp2+wo0pnJ2sf0S3pnarzQvhEzSY0essCKJIIy
X-Google-Smtp-Source: AGHT+IFAbITe1skvMBn1DxhBHmI4l8BOzKfL4mU8P4k1MJzRYjmJZEOlwj/IBMmHWKpL2D4X2+46NS4YWnZ878PKquA=
X-Received: by 2002:a25:ea4a:0:b0:dae:e896:2a5d with SMTP id
 o10-20020a25ea4a000000b00daee8962a5dmr6015479ybe.51.1699880252189; Mon, 13
 Nov 2023 04:57:32 -0800 (PST)
MIME-Version: 1.0
References: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
 <20231113125324.0cf1b58b@devstation.samdom.example.com>
In-Reply-To: <20231113125324.0cf1b58b@devstation.samdom.example.com>
Date: Mon, 13 Nov 2023 13:57:21 +0100
Message-ID: <CAOGObpi01iUPmGdB-KhjqNo8t0zgVWK8XJzjw8ATBYD0uWj8xQ@mail.gmail.com>
Subject: Re: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
To: "samba@lists.samba.org" <samba@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
Reply-To: Cristian Galvani <galvani.cristian@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Right,
is mapped to  'NT Authority\SYSTEM'
Samba version 4.16.11 on all DCs

Il giorno lun 13 nov 2023 alle ore 13:54 Rowland Penny via samba-technical <
samba-technical@lists.samba.org> ha scritto:

> On Mon, 13 Nov 2023 13:37:42 +0100
> Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
> wrote:
>
> > Hi!,
> > I have 3 Dc in my network, I enabled dsdb_group_json_audit on all of
> > these to json file.
> > smb.conf:
> > *log level = 1 auth_json_audit:3@/var/log/samba/auth_json_audit.log
> > dsdb_json_audit:3@/var/log/samba/dsdb_json_audit.log
> > dsdb_group_json_audit:5@/var/log/samba/dsdb_group_json_audit.log*
> > Everything is working as expected, if one my colleague on his local DC
> > change  group members the activity is recorded properly.
> > The problem is this, *on all DCs log file in the same moment* there
> > are some strange  activity recorded with userSid "userSid": "S-1-5-18"
> > and "remoteAddress": null.
> > all the activities record the removal of members from some security
> > groups but some members removed from those groups were not even
> > present, I am sure of this information because I restored a backup
> > prior to the activity and the user was not present in the modified
> > group.
> >
> > Any suggestions?
>
> 'S-1-5-18' is the SID for 'NT Authority\SYSTEM' and should be mapped,
> what version of Samba are you running ?
>
> Rowland
>
>
