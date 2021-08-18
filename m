Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E143F073B
	for <lists+samba-technical@lfdr.de>; Wed, 18 Aug 2021 16:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EEKd1COonBYqaW+4Hcevvn+OuW1wDHcz09RrqnUSkC4=; b=6P1CkyJ4q6JeUZb2os7rF3HqDt
	b1FOueJz4mJfv+1A8i4l1oBHsQ6tC6XHqibxtvelHkySsAlryEI/Jf9WuF49I/mj1ogruxD9AIbXc
	oyfEXSbClClogaubQQJUcsq5AACVcHaTaWabq//YcBKJuuBjm43nroVc4g/gZiViR0PspHHWwmiuB
	XNjZwqxWVlqQNslskowRdxMUw7Iwx3NA0h9ZXepbkgeqbVemGcqhNWr4xY8lY7AjY14E34u1CI2DZ
	19lM1YoiB8hYz/Lvu4TRgkE2/5es0kOh8CiZUAr9LTjmj5rmAFfUKtx2czVtwJn5s6xh4+V0W7ZfI
	osa/gx3g==;
Received: from ip6-localhost ([::1]:33206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGMzw-007VpE-BA; Wed, 18 Aug 2021 14:56:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29239) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mGMzq-007Vp4-L6
 for samba-technical@lists.samba.org; Wed, 18 Aug 2021 14:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629298606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S26DZZEwWg1SE11XRdwyy04l/bpnoZsVnf5/4YeMBTI=;
 b=N9D551JBfcZNdUuCDt63JY1hLsPQfkvJI+AG+lwN+O8fsLonwVI19O3CMrBGlWSvl2OWp5
 gVBwHKu4tjdo1n1OGMot3qb07sMZ5UBJYwZIIiy33WYfIKUtze9vNUUDffk5mrDfPBnHnS
 +6+igjaLe7TtGZv7xmTcD2M9PpV24ng=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629298607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S26DZZEwWg1SE11XRdwyy04l/bpnoZsVnf5/4YeMBTI=;
 b=OvCTbsA1Re0zAOG6S0nS4Hso/3ghzufDszP2Ms5vc4ysxB6pxU6Psy7CRRv7dUKXIYADTl
 ah9nrZsDQ93oj10xWZQ3PN/iTLvReZv1GO2qXg/LlMD0CinYIpwShIuhns9QYYbzmsCe4T
 9K2GJX/6Ot9H23PUef9VfWVUIUyU6sU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-Mde11NtXMayrxUbJm0Zb9g-1; Wed, 18 Aug 2021 10:56:44 -0400
X-MC-Unique: Mde11NtXMayrxUbJm0Zb9g-1
Received: by mail-pf1-f199.google.com with SMTP id
 k21-20020a056a001695b0290329e718b5a3so1419366pfc.15
 for <samba-technical@lists.samba.org>; Wed, 18 Aug 2021 07:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S26DZZEwWg1SE11XRdwyy04l/bpnoZsVnf5/4YeMBTI=;
 b=A9jIB2j1Mrw9O7+ncSVP58C0dI7Stq1sMrrpm75fzJG4yJmQ9kETA+cAv387SsSt5c
 ztiJM+rmJ/yN6EKOF3OX5d8nf0Gv3gjCHVSK9ttQhOeEKqKdG3Gq+XKeJsdjPXfAwbuH
 C54L/6tGIXEFjwsUaiIZt9UejAMVOGKxmipBPpja3SYjig5edNXO24TiqCft0ddeJjip
 0vv1TFRwqt0lEqECxYlm8E2F1u5nXaL16CDjMl1lN8YQmk3UdvlFwXqkDpOj0CUPvbnX
 j4ixxBoqbmQxgL0eFCIaxJnI0sVwbTFVWVYzgFoyPas3raRJTSpnNf7pLWWuGxw3G5v2
 KuEQ==
X-Gm-Message-State: AOAM530dZinPD3af1V59selPm97M1atZvj/SJCxFWqSkI6PqWRm8RcAb
 knn3VSCFTWOs8+VS/PdvdEqM3xFwNDOq8woIkfsPMgeQqksZBeuTOX8qg3dW/cLgULdCv83L0tu
 4LfInJS7dqbr+P+Kj6FtvojxlGLddISfFFtLiUoQDYRl7
X-Received: by 2002:a63:1247:: with SMTP id 7mr9172784pgs.366.1629298603294;
 Wed, 18 Aug 2021 07:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvrE8ORMS6PGQgsD4PVO2dh8gHEqRzxlI4jTQcM3yaQKXPGIKmFSM7S5Eo0r+S+HiOHwoJiGIFobK8zsyf9as=
X-Received: by 2002:a63:1247:: with SMTP id 7mr9172771pgs.366.1629298603087;
 Wed, 18 Aug 2021 07:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10tURuNjrFxj5CrMqQVkaSbU3feRnmp+GDD7S7kD+oHnGg@mail.gmail.com>
 <43369cfe-75bc-3e48-ca6e-14983e8013ae@samba.org>
In-Reply-To: <43369cfe-75bc-3e48-ca6e-14983e8013ae@samba.org>
Date: Wed, 18 Aug 2021 16:56:31 +0200
Message-ID: <CAEcb10s_VcTLiVNVFECtQ4uDvFM1+UB28jtbFHPbWK+AhGkiww@mail.gmail.com>
Subject: Re: Why the communication between winbindd child and DC is not
 asynchronous?
To: Stefan Metzmacher <metze@samba.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Warn: TLS-SNI hr1.samba.org
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze,

We should actually enforce dcerpc_binding_handle_call() to be not recursive.
>


I assume that  dcerpc_binding_handle_call() becomes recursive only if
(DEPRECATED) dcerpc_binding_handle_set_sync_ev() is called, but this is not
present in librpc (only in source4) and not called by winbindd child, or?
Also if I run 'id ADDOMAIN/user', none of the below breakpoints is hit in
winbindd child:
tevent_loop_allow_nesting
dcerpc_binding_handle_set_sync_ev

Can you please give me an example of some scenario which has a
non-asynchronous logic in winbind child? I would like to get familiar with
that, I am working on improvement of winbindd traces and  that might
beinetersting.

Cheers,
Pavel





> In some areas (at least in the past) we had the usage of *nested* event
> loops,
> where tevent_loop_once() is called recursively more than once on the same
> stack
> on the same tevent_context structure, which leads to unpredictable results.
> But I think we need to avoid the usage of tevent_loop_allow_nesting() and
> prove that everything still works, which is a very hard task to do.
>
> It would be nice to have everything async and tevent_req based in the
> parent
> and avoid the children completey, but the logic within the children is
> often
> very complex and it would be a lot of work to rewrite it to be completely
> tevent_req based.
>
> metze
>
>
