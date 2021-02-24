Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7763243AC
	for <lists+samba-technical@lfdr.de>; Wed, 24 Feb 2021 19:22:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QwuU3xNF676fW0Qz6Yj10YsJuKwVnZI2peLj/ip0DBk=; b=zzM1/XvEV84tvKCnHtVdfRr5c9
	uYJgYlWLvFoDglVDKLhXSP6+Lskn5cfxODxMPBlGCOE2h0X1IJ9c6DXEvL5XHZF3cUsLkvGIG/EMN
	RFjTxr1vjryVM4alb7fW6uodp4o0+GCQGA5EXKFOqvDxjb4NJowwxq54BxLoMepYKPxBslTs2L1kS
	SoCyn5lHtorKLS4KgZ557J3nFiE15AzBML8s+7Sg++1grVxTAA6Zl8B64QyrvDQzfqbgDFrcTF7qg
	8F2fEftRRehH6he/1J/xFY8Olish4e+hLpvIreO90Ftfv/O1jWtawRARKUn3nPknubAuLyJnvwASW
	8+/Hjo3Q==;
Received: from ip6-localhost ([::1]:46910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lEynU-001D2m-CZ; Wed, 24 Feb 2021 18:22:04 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:37611) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lEynO-001D2f-BC
 for samba-technical@lists.samba.org; Wed, 24 Feb 2021 18:22:00 +0000
Received: by mail-lj1-x22a.google.com with SMTP id q14so3524882ljp.4
 for <samba-technical@lists.samba.org>; Wed, 24 Feb 2021 10:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QwuU3xNF676fW0Qz6Yj10YsJuKwVnZI2peLj/ip0DBk=;
 b=qKxMfaf2Q/JZMspNxla3/+NfLvsDeBiAvUoDgJt6FF+TdtyHON3jL6FU3AZ+vKSmSH
 JLPgZ9lVobDomgT8Q8riTiAUDwflZ8ZuHVeeBLusqZAnXL0/yRbabvIogX79tbCIK8o7
 FTw6KeiGf8OIh2txoI78L0LOXyj8d9yUlwiASOth3FLOSBN0DVIDKkxxccjLrt1oBClz
 /omog7BnUxz5WYE1HOR87OUgHcZwwjAfdvROMDc3WrbtAj5R3REXfpSczfivchAhPklY
 nC3SIXyOTyzGzaGOaGXZa+bd3PT5rIAxCn3by0DqoecIr66wnwrkOMYz/IBvZwS6JPiL
 ARpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QwuU3xNF676fW0Qz6Yj10YsJuKwVnZI2peLj/ip0DBk=;
 b=npcC5ZNhKtiLjNA1PXvy/Jn6aw2e3TQsPClmWFuQXkyxdFGUGXFkEv3wyHzBKj+xuQ
 rgjVtgWIaIZxzoVgsIhojGPklAtIDlCk2ZGXdQTleb1GcZVS8MaYEYGmFtXLpUWUiRmF
 f6cYvRZDA4G4qsvHQTXwLfwGugBCES/ERUW8hPznQhZNqRvFPzcqiX1vaim2yZtKSut0
 3O4g46CYr+Oy3zkWdPig/pLE0o6Rm9/JIltXd6SAjxeFbkQz3Uh0L7RL0YKkfKvDeLYr
 V7K01Aszkvg4UEnAEkIk0FuaeNZEvghjO+IjKhQHqKjiYfK0ChbvBVf44nVrlOnYUB98
 Zynw==
X-Gm-Message-State: AOAM5317HOwOf18T+NeRY7rEZbq1DT9t+O9p+gay5/FBCKKG2s5wuoFv
 tZR38IUXWb+PAI7FeAlK69mJmjiwpBTHyrw7yTo=
X-Google-Smtp-Source: ABdhPJzaCwpMz2+DTaDyqGhTBcN+1XCXz4IkU13Hlz4RHEkTYcjOGmzRg/P/yDuFAibTEOJCOPXJRb5/xGT3ZJAXoLw=
X-Received: by 2002:a2e:9617:: with SMTP id v23mr9691246ljh.406.1614190906617; 
 Wed, 24 Feb 2021 10:21:46 -0800 (PST)
MIME-Version: 1.0
References: <1ca0f87e-83b3-b4dd-4448-b44f2a9d1698@canonical.com>
 <SG2P15301MB00639032FD6F37360A458E2D949F9@SG2P15301MB0063.APCP153.PROD.OUTLOOK.COM>
 <CANT5p=obm1EaZm+exAwjRdgrh1YV8bfMZWe-=nmwP7ExTWqX+Q@mail.gmail.com>
In-Reply-To: <CANT5p=obm1EaZm+exAwjRdgrh1YV8bfMZWe-=nmwP7ExTWqX+Q@mail.gmail.com>
Date: Wed, 24 Feb 2021 12:21:35 -0600
Message-ID: <CAH2r5mue5TxydZJFiV=z8eDPfYDDtnj-CfT7ac+tHyz+s5XYYQ@mail.gmail.com>
Subject: Re: [EXTERNAL] re: cifs: Retain old ACEs when converting between mode
 bits and ACL.
To: Shyam Prasad N <nspmangalore@gmail.com>
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
Cc: Steve French <sfrench@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 rohiths msft <rohiths.msft@gmail.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shyam Prasad <Shyam.Prasad@microsoft.com>,
 Colin Ian King <colin.king@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Add the RB from Rohith and merged into cifs-2.6.git for-next

On Wed, Feb 24, 2021 at 10:58 AM Shyam Prasad N via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Steve,
>
> Please accept this fix for the bug that Colin pointed out.
> This can be hit if the server has a corrupted SD, or it got corrupted
> over the network.
> We used to ignore the ACL in such a case (which in combination with my
> patches caused the issue). But I think we should be returning an error
> immediately.
>
> Regards,
> Shyam
>
> On Wed, Feb 24, 2021 at 7:16 AM Shyam Prasad <Shyam.Prasad@microsoft.com> wrote:
> >
> > Hi Colin,
> >
> > Thanks for reporting this. I'll submit a fix.
> >
> > Regards,
> > Shyam
> >
> > -----Original Message-----
> > From: Colin Ian King <colin.king@canonical.com>
> > Sent: Wednesday, February 24, 2021 6:14 PM
> > To: Shyam Prasad <Shyam.Prasad@microsoft.com>
> > Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org; samba-technical@lists.samba.org; linux-kernel@vger.kernel.org
> > Subject: [EXTERNAL] re: cifs: Retain old ACEs when converting between mode bits and ACL.
> >
> > Hi,
> >
> > Static analysis on linux-next with Coverity had detected a potential null pointer dereference with the following commit:
> >
> > commit f5065508897a922327f32223082325d10b069ebc
> > Author: Shyam Prasad N <sprasad@microsoft.com>
> > Date:   Fri Feb 12 04:38:43 2021 -0800
> >
> >     cifs: Retain old ACEs when converting between mode bits and ACL.
> >
> > The analysis is as follows:
> >
> > 1258 /* Convert permission bits from mode to equivalent CIFS ACL */
> > 1259 static int build_sec_desc(struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
> > 1260        __u32 secdesclen, __u32 *pnsecdesclen, __u64 *pnmode, kuid_t
> > uid, kgid_t gid,
> > 1261        bool mode_from_sid, bool id_from_sid, int *aclflag)
> > 1262 {
> > 1263        int rc = 0;
> > 1264        __u32 dacloffset;
> > 1265        __u32 ndacloffset;
> > 1266        __u32 sidsoffset;
> > 1267        struct cifs_sid *owner_sid_ptr, *group_sid_ptr;
> > 1268        struct cifs_sid *nowner_sid_ptr = NULL, *ngroup_sid_ptr = NULL;
> >
> >     1. assign_zero: Assigning: dacl_ptr = NULL.
> >
> > 1269        struct cifs_acl *dacl_ptr = NULL;  /* no need for SACL ptr */
> > 1270        struct cifs_acl *ndacl_ptr = NULL; /* no need for SACL ptr */
> > 1271        char *end_of_acl = ((char *)pntsd) + secdesclen;
> > 1272        u16 size = 0;
> > 1273
> > 1274        dacloffset = le32_to_cpu(pntsd->dacloffset);
> >
> >     2. Condition dacloffset, taking false branch.
> >
> > 1275        if (dacloffset) {
> > 1276                dacl_ptr = (struct cifs_acl *)((char *)pntsd +
> > dacloffset);
> > 1277                if (end_of_acl < (char *)dacl_ptr +
> > le16_to_cpu(dacl_ptr->size)) {
> > 1278                        cifs_dbg(VFS, "Existing ACL size is wrong.
> > Discarding old ACL\n");
> > 1279                        dacl_ptr = NULL;
> >
> > NOTE: dacl_ptr is set to NULL and dacloffset is true
> >
> > 1280                }
> > 1281        }
> > 1282
> > 1283        owner_sid_ptr = (struct cifs_sid *)((char *)pntsd +
> > 1284                        le32_to_cpu(pntsd->osidoffset));
> > 1285        group_sid_ptr = (struct cifs_sid *)((char *)pntsd +
> > 1286                        le32_to_cpu(pntsd->gsidoffset));
> > 1287
> >
> >     3. Condition pnmode, taking true branch.
> >     4. Condition *pnmode != 18446744073709551615ULL, taking false branch.
> >
> > 1288        if (pnmode && *pnmode != NO_CHANGE_64) { /* chmod */
> > 1289                ndacloffset = sizeof(struct cifs_ntsd);
> > 1290                ndacl_ptr = (struct cifs_acl *)((char *)pnntsd +
> > ndacloffset);
> > 1291                ndacl_ptr->revision =
> > 1292                        dacloffset ? dacl_ptr->revision :
> > cpu_to_le16(ACL_REVISION);
> > 1293
> > 1294                ndacl_ptr->size = cpu_to_le16(0);
> > 1295                ndacl_ptr->num_aces = cpu_to_le32(0);
> > 1296
> > 1297                rc = set_chmod_dacl(dacl_ptr, ndacl_ptr,
> > owner_sid_ptr, group_sid_ptr,
> > 1298                                    pnmode, mode_from_sid);
> > 1299
> > 1300                sidsoffset = ndacloffset + le16_to_cpu(ndacl_ptr->size);
> > 1301                /* copy the non-dacl portion of secdesc */
> > 1302                *pnsecdesclen = copy_sec_desc(pntsd, pnntsd, sidsoffset,
> > 1303                                NULL, NULL);
> > 1304
> > 1305                *aclflag |= CIFS_ACL_DACL;
> > 1306        } else {
> > 1307                ndacloffset = sizeof(struct cifs_ntsd);
> > 1308                ndacl_ptr = (struct cifs_acl *)((char *)pnntsd +
> > ndacloffset);
> >
> >     5. Condition dacloffset, taking false branch.
> >
> > 1309                ndacl_ptr->revision =
> > 1310                        dacloffset ? dacl_ptr->revision :
> > cpu_to_le16(ACL_REVISION);
> >
> >     Explicit null dereferenced (FORWARD_NULL)
> >
> >     6. var_deref_op: Dereferencing null pointer dacl_ptr.
> >
> > 1311                ndacl_ptr->num_aces = dacl_ptr->num_aces;
> >
> >
> > Line 1309..1311, when dacloffset and dacl_ptr is null we hit a null ptr dereference on dacl_ptr.
> >
>
>
> --
> Regards,
> Shyam



-- 
Thanks,

Steve

