Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C93631094
	for <lists+samba-technical@lfdr.de>; Sat, 19 Nov 2022 21:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FwUOG5FZhO4dhjRA45yKkVi3IF2EbFqShN5s+O9Kd5s=; b=2ybXsFsln35LrZ9D0xuqHzG9lr
	Dx7tRVPZq0ivf+IU5Bv+pdbt0S/XCr00oELDVeC75462jYgR85PZYX6RTABrTGcls19r3P7mYuVAg
	e0rLyDzrelBubyM6DXVcp+4XUHUG6PPAjpoXxU0RqclwQkRfojSamW6Y7TO031r1j23UHO89Xezi2
	BmF6oKZupy32scTMguNXfrNFYZ4s0Z/SKrKNmKtgbtuyAyAEEegGXrzNpuquVmwqUEw28qB4O9bya
	A2oIW5kGowP+36uZHZqLz2oQSUHnt7ifcE63mSmPu/7RFVHyhsba1wuz3GLgLtF0bnD+tqVX83k2o
	brOb6xbg==;
Received: from ip6-localhost ([::1]:36180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1owU0U-00Fijx-8k; Sat, 19 Nov 2022 20:00:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:33640) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1owU0L-00Fijn-M1
 for samba-technical@lists.samba.org; Sat, 19 Nov 2022 20:00:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id j4so13398696lfk.0
 for <samba-technical@lists.samba.org>; Sat, 19 Nov 2022 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FwUOG5FZhO4dhjRA45yKkVi3IF2EbFqShN5s+O9Kd5s=;
 b=kTWTIjYrz6ZFGwCgHRFnWSySppLVS9chsJ6CUdWyF1JGlGUfpN1sSCM4oCE3wyIAk+
 xZgJ5ulAnN0jJ6CifLlbcCvc+ekdarqot/KOWwUN269rjvcnCMzh3uC5F0RqZkbauMfL
 lwYYmuE+DQND/FQLHz984/KOAIYZbRNl6/SEiZ/qAnwIvZU/5FWXzmCblm3Sfm1LkZet
 1OmrPexF1kbNHhyzQx8w4V5sQw3UmkfssoA0B+5mof7/Sc+RHhTDhqGSzuixqI1aVwbB
 Zo63Bz/v0vxgIQbinHB11eF2u6CuY08Aby/QjeFjUTYXq6lAEKt+63uTz+sNUqFgSM7J
 683Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FwUOG5FZhO4dhjRA45yKkVi3IF2EbFqShN5s+O9Kd5s=;
 b=wsdxNFjkBUJ+vC7/vHV9vqJjRwLtvY6UGoXHzCJfLF2foQwS/iTi2nFXzy7D98NpzP
 YtdP+pzD9xqf3vqGwxkcfYP706nLLtPyS3sD3SaFf7K9YnXUfNs2fsJ9n75YGuxtRl7I
 AirivtZ+8jsNGlT9Nq1QCoarSXwtPYgatf0XAxe0I+HvOhtG7Xt6tuKFDIfwNdZxD29S
 YfZ8a5qSZifL4Ld3g1+d3n0lKkK4S9+gYorzoFwxoJgcahppybHYOzbjMZlSbhKYbLds
 JqsQh1VdLDKhVPfhZTANWbfG71ZqqHiEsqJu27ek5pjW1SdUuOj88GMDZkoPNpo3dfza
 9VKw==
X-Gm-Message-State: ANoB5pmpdREk7oQ6yNCp0ZWR5r+754ViEW5j8nG7sE6RYy0TG3BpCZTC
 xGcAO/jtDom1FXkC+THllRQHQ29Ao8rRwH/R+cc=
X-Google-Smtp-Source: AA0mqf5d63RKrc4xvjMlt8kezPSfqPjOQZJjZruRI5krdmqgLc/0DQc66EaG3xIQ68ZyLoDI66yUP6Dd1X9mEXA6kjI=
X-Received: by 2002:a05:6512:3b8b:b0:4b0:54a9:38a3 with SMTP id
 g11-20020a0565123b8b00b004b054a938a3mr800423lfv.20.1668887987474; Sat, 19 Nov
 2022 11:59:47 -0800 (PST)
MIME-Version: 1.0
References: <Y3dw8KLm7MDgACCY@kili> <87edu0jp3r.fsf@cjr.nz>
In-Reply-To: <87edu0jp3r.fsf@cjr.nz>
Date: Sat, 19 Nov 2022 13:59:35 -0600
Message-ID: <CAH2r5mtHsg0tO1NB38xSUwK7_9ak5izaBMhwuasfHXo_Wx_ZFw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Use after free in debug code
To: Paulo Alcantara <pc@cjr.nz>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Dan Carpenter <error27@gmail.com>, samba-technical@lists.samba.org,
 kernel-janitors@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Nov 18, 2022 at 8:48 AM Paulo Alcantara via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Dan Carpenter <error27@gmail.com> writes:
>
> > This debug code dereferences "old_iface" after it was already freed by
> > the call to release_iface().  Re-order the debugging to avoid this
> > issue.
> >
> > Fixes: b54034a73baf ("cifs: during reconnect, update interface if necessary")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  fs/cifs/sess.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
>


-- 
Thanks,

Steve

