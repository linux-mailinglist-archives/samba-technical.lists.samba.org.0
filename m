Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D97B23D99
	for <lists+samba-technical@lfdr.de>; Wed, 13 Aug 2025 03:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iyHbuS794qJWSMl0okaqpUXn3swWc+Vt9V6hwOjIKuQ=; b=PkADNnvZJy4oyEcULoKb6j3KRx
	NOvZkdd19rOkHl0t7WEGwT0mkDhbcgYUXlHrjxaYM9hmaTb0PDixVu2Nh0uPIo23ToeX3oR9m5HLD
	+RKfABJZVaU24UfLaPm6hEKvRFxVkx87b318puOGuwqlEwr+0WqdrbHLyHUB6zYMQmIWgTclWEoEk
	jM5gzHZ3DfkiY9MZrffaMxS0buJzW79JiEHJzoqBEseYDsfb3l/N/HciX5KmKTFAfu+x+G0kQKeZr
	0eeH394Krt3SUvhA99ZPIIjxCidrIuvSzatTRgOlYxlu4Zc7U7CVyvWOSln5RlM9LOskb4LX34tum
	mdyLCpJw==;
Received: from ip6-localhost ([::1]:37736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ulzzp-00Evha-Bu; Wed, 13 Aug 2025 01:09:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:39096) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ulzzl-00EvhS-0F
 for samba-technical@lists.samba.org; Wed, 13 Aug 2025 01:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22A625C6B68
 for <samba-technical@lists.samba.org>; Wed, 13 Aug 2025 01:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4201C4CEF8
 for <samba-technical@lists.samba.org>; Wed, 13 Aug 2025 01:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755047363;
 bh=iyHbuS794qJWSMl0okaqpUXn3swWc+Vt9V6hwOjIKuQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=snDZ2sZ9CA+V7IjKjRkOxnn5uCy7R4JAoHcIZnfo4tN7tQ1TiVR3gKtQUaPNGNKti
 Q2jKGVewUZy7XoRKVUGYPEaAuyqvD6aLj54fR7CNm/DpBNwrChA++Eo8AG8VaRwB3I
 Y9Ki5H1qpVU/yT7G8QZxDpgo+2OBSG1k1DmiEF3wWt7P4zYuwdXRC1/nIuZUAXo3Ck
 AdIaKMTdtFxa9RPDAUjK5yfP1/x1iajpFavNdGRZ5qOMLPVPVbjWZ8rGhExb2vOZdl
 5C9VTGbD1xhqzZrFjUJAwVkNfarjpNQGTPwU8l5bKZW47gE/pDKhF6HrnjWtb7F5pQ
 mUksbJ0e9Nrww==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-61868d83059so900740a12.0
 for <samba-technical@lists.samba.org>; Tue, 12 Aug 2025 18:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVnMB1SRMRISXlL0htS9iOueWrO+9EKZsf7usHhuyny/THB+1CyW2yhTUvRPB+QpxQjqO/coUyrK+ReRBgZx4=@lists.samba.org
X-Gm-Message-State: AOJu0YwMLfYxyZid96elFUojAwGKLUmVcPhMlVIccH38hIrbbF8N81tv
 SPS0DKLdfKERFZGcdLUJQxQjTUeyUzORdGLUMtTySmaTE2htSn/lyAWEHEKmzpmtMjpZPLMyyGs
 SfxOZlVatYFUOilpM3FebuixhrWPsNjo=
X-Google-Smtp-Source: AGHT+IHNRv9T6lU2HI7jxb9cJ3DbiQJL+YPROXa9axvAHAAfPA+u0t80aECtZAE8etd5G+vTCR/aDcjMpyRSVnIFj1M=
X-Received: by 2002:a17:906:8d2:b0:af9:bfed:fbae with SMTP id
 a640c23a62f3a-afca83aa8efmr43803266b.10.1755047362296; Tue, 12 Aug 2025
 18:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250812164546.29238-1-metze@samba.org>
In-Reply-To: <20250812164546.29238-1-metze@samba.org>
Date: Wed, 13 Aug 2025 10:09:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9C79B+U8rEmWnDBCBMp5jsSMBWfkDFErLCQPHFUBB-4A@mail.gmail.com>
X-Gm-Features: Ac12FXxIDFrkTNQkjh1vqHWpr018EF5jCODh_aaEKcqC7fv5ZbhjZa567-KvyC0
Message-ID: <CAKYAXd9C79B+U8rEmWnDBCBMp5jsSMBWfkDFErLCQPHFUBB-4A@mail.gmail.com>
Subject: Re: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 13, 2025 at 1:46=E2=80=AFAM Stefan Metzmacher via samba-technic=
al
<samba-technical@lists.samba.org> wrote:
>
> We can't call destroy_workqueue(smb_direct_wq); before stop_sessions()!
>
> Otherwise already existing connections try to use smb_direct_wq as
> a NULL pointer.
>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing an=
d tranport layers")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
Applied it to #ksmbd-for-next-next.
Thanks!

