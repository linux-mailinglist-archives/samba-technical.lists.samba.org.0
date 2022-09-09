Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3F5B2FBA
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 09:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=OGP/5pIP0pZXVSAxCxaoZwjHVcfLC38qbKaPPBlSnEE=; b=T0Go9uuJyDntjXr00bro25NdTQ
	/EA+FV4Qbt3NC9vDyCLPfANg8Ly72Vb5SUfYbPCeVwb9xKtYUTnxlVbe8XydkAcQ2ZZB+gJR7xpSz
	ektf+JKeJSPbsRUwJ145TT6hpE9dzpbsjzmOswoiC/qM+S3vHLXWwWkldiGt8NQYYyYiDYFDMIbkE
	8C8nktiSRVXp8L+mCbAJ0N4enzaon6RCSqyyUCJTxN23q68GgGLXRzo9REzaFCxvzMYrUF+WioDB2
	eTzDPesWGBbzlGs0kQ/GFM48AUpdKUX8n/HuWpAE6fQjQcgNGkchkJuytiuchJQvTK9coRLaGfLS2
	nonjyIgQ==;
Received: from ip6-localhost ([::1]:52800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWYN6-0004nJ-RA; Fri, 09 Sep 2022 07:24:17 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:39886) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWYMl-0004nA-Bh
 for samba-technical@lists.samba.org; Fri, 09 Sep 2022 07:24:00 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id c6so603080qvn.6
 for <samba-technical@lists.samba.org>; Fri, 09 Sep 2022 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=HRxyFn4RQuIGlApcbCSYgT3B6fsSqARPfizaLolcEWk=;
 b=Im65OMyTPuAp/2kjTReSfueErTdKw0/kS6Hfi4tj9bqCIUsYRFztfkkwajGUzcUN5R
 h/deKKvji0LO5MPs8U0DVQV3FROM6QbQMQWWwh3N/KWumRftvCT+LmMoDxklzqxPCQDe
 5wjWr+6XA4L7H5rncbTkFjMbr5no9kt0toSc0bjQhgxQBldrql9ofXe60ntx6t6PD5VM
 ySwv+WXTcoSGynRgAWB5YMvcWnKnvh7KA4shIll7lXXzwBGqA8BL3XqMt59HuiB6CsGh
 jwfRS6K7evl5hkLa3PBnASQ6E9VGYcCmDtpj0M1GShqSM5u+czA7QDAvXgq7W5n5mzKE
 654g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HRxyFn4RQuIGlApcbCSYgT3B6fsSqARPfizaLolcEWk=;
 b=mAJfonjWDqqQbNFzX7VPaANaVwNDMfslnKtTIYiYw/L0y6aF5gXjr3psjLhtJm7m6y
 Qzw/Ah5bFmql72o7lmOkW1vJW4ogDNQksDMlTJE9iVr05MM7EvCP/3wYw84kLC0wPlrn
 yHjSgt2FQk2gY2DuK6DGDFg0+aVi7XVhKd3qd/+1wwHsZydxVcvFC1DVJqLW6ug+suy7
 k2glXhQ34uK082JrslgqRyHKde9EtQ/PFC9//PjncztEETwwAjXf9ySHPNMiUcKEDGYL
 kagDHjDtjQQ0k44oCEpjJV2BYaudTmeQgGD7qrEuZZuLiBS7ygLYR1UEuXUJX7YKvZcU
 qTTw==
X-Gm-Message-State: ACgBeo2PRd0gTh1IVrg4zglH5NEo4FAMnFfPTVwgKwYu4itZL75mpXA0
 /JI5TqU3ZSb+TIAaFLekyh6aP4qg2Sw/w56ifrCYwQFv06Pp0za4
X-Google-Smtp-Source: AA6agR6WkV8Xv+2bf2jXriylxnpsZvaKvXEJs4Du2KBGiE4RDxxilsYvvGA6CoOCs9n/9nVF1+XvUmcpKJOQQC24VR8=
X-Received: by 2002:a05:6214:224a:b0:4aa:a7c3:f6c3 with SMTP id
 c10-20020a056214224a00b004aaa7c3f6c3mr10796918qvc.129.1662708222980; Fri, 09
 Sep 2022 00:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHA-KoPFeH1S6ufMz2HLNjRmjrLMawbKkAw9qns0VEu3UDLYEQ@mail.gmail.com>
In-Reply-To: <CAHA-KoPFeH1S6ufMz2HLNjRmjrLMawbKkAw9qns0VEu3UDLYEQ@mail.gmail.com>
Date: Fri, 9 Sep 2022 19:23:31 +1200
Message-ID: <CAHA-KoMJkYqxBoOafGfc9X+ANi1qbeZvBokyXRyxa6scLZ9aSw@mail.gmail.com>
Subject: Re: Using regcomp/regexec in code - are POSIX extended regular
 expressions available all archs?
To: samba-technical <samba-technical@lists.samba.org>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Got an answer.

Have put a simple extended regular expression '^[0-9a-fA-F.:/]+$' in
source3/utils/testparm.c do_netaccesslist_check() in the merge request.
Found that source3/param/loadparm.c has REG_ICASE flag in call to
regcomp(), so it looks like the POSIX regex(3) is supported.

Thank you!

Matt Grant

On Fri, 9 Sept 2022 at 16:21, Matt Grant <matt@mattgrant.net.nz> wrote:

> Hi!
>
> I am looking at using these functions in source3/utils/testparm.c to check
> network/netmask and IP address for use with lib/util/access.c
> allow_access() parameters for dynamic DNS filters for the SAMBA_INTERNAL
> dns server.
>
> Are the Linux POSIX extended regular expressions available on all compile
> targets?  (*BSD, Linux, SVr4, AIX, IBM i) etc?
>
> Been around Linux since the early nineties.  Things would be easier if
> Samba supported libpcre2, the Regexps for samba-tool testparm are a slam
> dunk as they are basically Perl regular expressions.
>
> Want to know before cutting code and getting it into master.
>
> Best Regards,
>
> Matt Grant
>
