Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A22F979D
	for <lists+samba-technical@lfdr.de>; Mon, 18 Jan 2021 03:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UCNr++Ssi+GCJXfceKYWtjuCgckAsDZ7Hj+PCOxiPFI=; b=pLx2foSEqCFG3W+9DxonM0tEI8
	JOV+RUQUxPpJBwh448UTdeZsLBss2+FdhQ5UkibQ3X6zfhYxuoVHSwnvRh3kLWOk1vsJx6tjlpWkX
	VQngnJnvyHZZq4Ng8i3dsoOFHIiT2UUs5x99tmqd0++bdFDYoPiVbrGv6XVOCbjmXNF/lLhFHyHir
	ofnJiqB4umSDtl6byVsTcViyRACocJ++S6w/fAD9P4tFjnhjsvawFA9Yaczq9BaMkRAi/LQfZ3glI
	579CBql2ASf8cpe9TPbBw/pLznqPY0XcytAQ0nFLS+FWSoJ6flqsMQwkdHjLcITJ46my9xjjmNJbk
	94lQFdNw==;
Received: from ip6-localhost ([::1]:32586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1JyB-0060a2-VQ; Mon, 18 Jan 2021 02:08:40 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:38703) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1Jy6-0060Zv-Mo
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 02:08:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id h205so21773667lfd.5
 for <samba-technical@lists.samba.org>; Sun, 17 Jan 2021 18:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCNr++Ssi+GCJXfceKYWtjuCgckAsDZ7Hj+PCOxiPFI=;
 b=Wk1tFUMhMF6+naycYPO5gIKoQs44ym7L+cXKP2iv6fsgQkelky9y5Y9OVGM1P4yfTl
 /RoxHrZ/ZrPlYJ3wP+lUMsmPfwbDCLvoeS26f0b+6SAdG2TwIkmWho2Zb/PwAWx5jY9S
 0oOFpc05VzN4dyPOFoyBZDZVXfCgUok/9CqiOfZdWwIjrYFyVlhtwk+J30tzVrUxND32
 rfnZ0DX1GVMyi5fnD/ePq+8Njwh68TqQKt1YmwTF5D2ra4kyhR8vwlZKDQX4Ou4s2HtR
 bNgl1gDjrcgsSh4DG1BY7r6/4jlUmCi3lbROe8f3U77auAMgRLLXzjsvG1zPxVyLxSYh
 RhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCNr++Ssi+GCJXfceKYWtjuCgckAsDZ7Hj+PCOxiPFI=;
 b=E/FcH94bqLDzV2oD1TgwX3qv9fWPYeylllbGDseU30Gx4hglT0uxgBVOFxoIYX1U0r
 dxJJOyE18GvJ+9gfJIizaPPxzmRa8FUTAYWYsWHHjkrjFW8O/mXnFUXcf91ltO+Cs3CK
 W5Y7uPwUVEWO8IYn0gfw21YBMDYma2tTby6U1K1Ym8sIUJTUovVugOvu84HtvzcnPSNC
 WOlCpw85zQETzS7am+RXMNw2JpBUXpagkUz+aN0KEhbMUEt7nBsgFS4cAVRagc5lpABK
 v7dQNEVrGjHSrLWOt1kzpnHAhhvwm2ilk8+de1yKJQGiz9zt0oPccm1H9Fao2VvGLrDE
 YO8g==
X-Gm-Message-State: AOAM533zely9tRtkvfQldg4aPGvqQ0J2RC46VR5UzPX7LnMIvo7GvPs4
 Jx3DYAR2dsvWAiECauxnksUs3SjMymoYMeirsAY=
X-Google-Smtp-Source: ABdhPJy1F7PzMeYmUBqKJFwc+OMyBL9Qjt2TMLg2k5TKElN6wCIQIQXXiSfFrAe/V1nyxKQqvyrpCeqNeJ3jhJIIhmE=
X-Received: by 2002:ac2:5689:: with SMTP id 9mr10870086lfr.175.1610935712208; 
 Sun, 17 Jan 2021 18:08:32 -0800 (PST)
MIME-Version: 1.0
References: <1610615171-68296-1-git-send-email-abaci-bugfix@linux.alibaba.com>
 <87czy7lvjy.fsf@suse.com>
 <CAH2r5mvjDAgB6-kE=AOAwrETVk+R79z6Gd8gMnOTWqG-6Mnybw@mail.gmail.com>
 <20210118000152.GH3579531@ZenIV.linux.org.uk>
In-Reply-To: <20210118000152.GH3579531@ZenIV.linux.org.uk>
Date: Sun, 17 Jan 2021 20:08:21 -0600
Message-ID: <CAH2r5mtaf6Kmg2RAxawsV9o=VHyu9hosqa4fZw5QDHLH-tacfg@mail.gmail.com>
Subject: Re: [PATCH] fs/cifs: Replace one-element array with flexible-array
 member.
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Jan 17, 2021 at 6:02 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sun, Jan 17, 2021 at 03:58:23PM -0600, Steve French wrote:
> > Jiapeng,
> > Aurelien is correct, you should respin this patch and correct for
> > where it breaks the sizeof calculation.  For example your change:
> >
> > struct smb2_lock_rsp {
> > @@ -1434,7 +1434,7 @@ struct smb2_query_directory_req {
> >         __le16 FileNameOffset;
> >         __le16 FileNameLength;
> >         __le32 OutputBufferLength;
> > -       __u8   Buffer[1];
> > +       __u8   Buffer[];
> >  } __packed;
> >
> > would have the side effect of making the file name off by one:
> >
> > smb2pdu.c-4654- req->FileNameOffset =
> > smb2pdu.c:4655:         cpu_to_le16(sizeof(struct
> > smb2_query_directory_req) - 1);
>
> FWIW, that sizeof() - 1 should've been offsetof()...

agreed

-- 
Thanks,

Steve

