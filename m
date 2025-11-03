Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A52AEC2E5EE
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 00:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZH0fDpUKrbZ7Y4RH7y1khfYrGo0F4yDKdY+imctMyp4=; b=vnGo2+s83HII/TqLBhjjwBpTYK
	GkQVfHDip9OC7TW0jzPc0/PuK6/lqef0SEOXiH4Fs8sfELB5IQivVFdND4jiz4Gf8zx1tbs7arGQz
	dQn+y8rEkF9f94xiaq6dyxpSXXcVNQwIkIwmr7f++4r9hg2uB2rTGvzqZMGu8ksMRiLGjdxAZr79a
	NyfoUDlFVHHXWKnrGvG9Pt1zv+UKg3+DZ8+WQc15L145BSBalYWtH5SZotef4C4Gj23NBZ+OBJZ4P
	HXZ55cnt8jI4sDt4JWzENviuOPr02od3vkqV5D809K/B4dveT2a+QuCMM3TgORdfoKjvMESzenOR2
	UtxJptgQ==;
Received: from ip6-localhost ([::1]:43688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vG3bX-00BOu7-1k; Mon, 03 Nov 2025 23:04:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:50269) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vG3bS-00BOu0-NN
 for samba-technical@lists.samba.org; Mon, 03 Nov 2025 23:04:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so989167266b.0
 for <samba-technical@lists.samba.org>; Mon, 03 Nov 2025 15:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1762211085; x=1762815885;
 darn=lists.samba.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZH0fDpUKrbZ7Y4RH7y1khfYrGo0F4yDKdY+imctMyp4=;
 b=SLoqTHJsfwuf/ioANPUxTDigQOddETKKb/DmL04CT5OIajoEER9v780L81slXNaZMO
 KcCcNZELJwmGmpe8JYNIIPWf1i3Rpv0vZvZHt0Lq4ywiViOzrw/l84aoqu+VC4nomtGn
 OEqzz2ygEsBleyuQzNg+4j/MHxeGEKks/Maao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762211085; x=1762815885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZH0fDpUKrbZ7Y4RH7y1khfYrGo0F4yDKdY+imctMyp4=;
 b=VVyQ/mgAUQNKhdIuzLYrXSMITDVj3qRgT0c9AVE8+rC2Jhp1X3Pn4vl//CotqypmX1
 iTVc1UZq0A+Vq/dgJajM6v1ZDQStn/Tz/YcHkVyLYxtZ0BBT31khLV0zqF0FZ0LqYHH4
 lIORKjsb2Rv2TliKwp6uxy+/wRbH4g+G8wDHHc5aidxkky+3JbWODhJJMW3MW9s9NWnL
 Rfy2g5pDO6AUDSmEp5XDigPzaMuiVNa+xy5KgOz6L0NbtpDrqeuZ9oUp4wUWOPPouQ7t
 r+YwZJ8wBWODDMBWV0a1+v/1fX1aGvJl80ZvvYK9l0o5Lec6iyhaM0zfeGVQbrZsnPx5
 tQmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVciH6Pr4TrnnP79bEE8AeK/DpLL3GQgl3ATETGnlVIpm7ETdsfc6/tZvsd21VcX5XJDQjV8mgwYOuTP1JW2No=@lists.samba.org
X-Gm-Message-State: AOJu0YyRNepogGWgiQt/9ap0OGLOhLAOANuirlqcSt/R3op1x60hy+5U
 ric3Y9yiH/W3Imuc6unVCKSsX/Q89dghJmokH4E55eIgFRYYdrCfry79HSexmhXW+7nGouGDx8v
 rAf3/jhPbLA==
X-Gm-Gg: ASbGnct0zSVDYJEWY9XLYUBIHLh+4IYe5bt2XwGHY7tRMIsMSmgdKOl9GI//OyGK6Za
 bsVFW5Ea7FpH3RxT+M9ALC31wLBrrUeHld8n2/uUASY8eLY8tYSfogqMBuSSlbu2e/uzialj7kA
 zltd/O3aRYxvGh8ivQht7XAuSBoH0HblFmw46piYblFGxfbZy2xvOpLsINiOz+fdD2jQrvjeCyf
 MRLSaDSi7P+QDv0TejtIKN2yoe7ZYL2Rwzeh0w11Ca240PlrmrhJIpsexgFgf1sXx+L+//Ncl8m
 zFjdMXQfuQulW/CQAEoQMrk9xNm2qdox8da6QuHzzmoqmtweYP0/n8h494/k74DmUGvwkwWJgva
 erqn4HWXMoIfJbMre4louTum9AREQ2NBGqQjQ9iJ+VyPJD4PbXjt2cNPPbaO8vynlaBemlpzPoJ
 IqCZNqfZAyJM3+cJzQ7xZazf0K9eZTtrixJBYNeJn7AaE2cXL/ETNeGYBqTUzu
X-Google-Smtp-Source: AGHT+IGHsydTm4l8F4vi8hiTptapLS0nzZHXzHWTxfu9u8FikcxMtEafAASIniOR/2TJTn5H+ol+9g==
X-Received: by 2002:a17:906:4791:b0:b57:2d81:41f with SMTP id
 a640c23a62f3a-b70704bc3c2mr1710029666b.40.1762211085485; 
 Mon, 03 Nov 2025 15:04:45 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723abdafa9sm35959066b.0.2025.11.03.15.04.44
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 15:04:44 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-640e9a53ff6so166768a12.0
 for <samba-technical@lists.samba.org>; Mon, 03 Nov 2025 15:04:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWsgzObQRIKURsk/A4I40q47xYi74JYaM9x821FenxdRyXA5wyBOJqVO6CkAcXGml3z6cs6mWFYwgzIBVThW8=@lists.samba.org
X-Received: by 2002:a17:907:1c28:b0:b71:854:4e49 with SMTP id
 a640c23a62f3a-b710854688emr499540366b.56.1762211084280; Mon, 03 Nov 2025
 15:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20251103-work-creds-guards-simple-v1-0-a3e156839e7f@kernel.org>
 <20251103-work-creds-guards-simple-v1-14-a3e156839e7f@kernel.org>
In-Reply-To: <20251103-work-creds-guards-simple-v1-14-a3e156839e7f@kernel.org>
Date: Tue, 4 Nov 2025 08:04:28 +0900
X-Gmail-Original-Message-ID: <CAHk-=wiSmez2LFEpM05VUX=_GKJC8Ag68TJDByVPO=x4QwjyuA@mail.gmail.com>
X-Gm-Features: AWmQ_bmQaBgs1Hs2Yx75LVx_L0plRwfdpBhmjm5wyWf-G7aoJOGX7gmwXWEf8f8
Message-ID: <CAHk-=wiSmez2LFEpM05VUX=_GKJC8Ag68TJDByVPO=x4QwjyuA@mail.gmail.com>
Subject: Re: [PATCH 14/16] act: use credential guards in acct_write_process()
To: Christian Brauner <brauner@kernel.org>
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 3 Nov 2025 at 20:27, Christian Brauner <brauner@kernel.org> wrote:
>
>         /* Perform file operations on behalf of whoever enabled accounting */
> -       cred = override_creds(file->f_cred);
> -
> +       with_creds(file->f_cred);

I'd almost prefer if we *only* did "scoped_with_creds()" and didn't
have this version at all.

Most of the cases want that anyway, and the couple of plain
"with_creds()" cases look like they would only be cleaned up by making
the cred scoping more explicit.

What do you think?

Anyway, I approve of the whole series, obviously, I just suspect we
could narrow down the new interface a bit more.

                Linus

