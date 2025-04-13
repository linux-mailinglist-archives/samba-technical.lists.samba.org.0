Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C33A87072
	for <lists+samba-technical@lfdr.de>; Sun, 13 Apr 2025 04:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=voNzLC5BpZqgahsmn4i6sfJIo0eN2XsIk1qhy/YQ5C4=; b=rhVPsixZRBhMgjbdMULYWx8pAQ
	qHFvXN0gW48yfqhx/AfSYVF0Y8ADxElwMrVvWOPjDxnULuC5f3YwMBBVZTdV+Rair34U35RM3Z3l0
	yuZBIPXpSxnvKZpykNe6ahAik314AFU61irMEuyClXDedRM+smYGIhnAiUzG5Bxhm6yjmbWqyScUA
	s7wAkA1o/prLiPv10q2iJEKekAVrrThOb93BA8wnqxAKmDROTZCwxBluQnN5ffIPgda/HyGFBFJKz
	mrVBlKf6/aKd0+VIgOWk6IHcjSYxQl9CGXbQKpjTydxTqa3eNqWZBp6Wz5MR9HRaSwkUzLyxOF74+
	bMXwr/cw==;
Received: from ip6-localhost ([::1]:30930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u3nBp-002Jyy-Ki; Sun, 13 Apr 2025 02:35:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:60821) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u3nBk-002Jyr-S5
 for samba-technical@lists.samba.org; Sun, 13 Apr 2025 02:35:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5497590ffbbso3307451e87.1
 for <samba-technical@lists.samba.org>; Sat, 12 Apr 2025 19:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744511703; x=1745116503; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=voNzLC5BpZqgahsmn4i6sfJIo0eN2XsIk1qhy/YQ5C4=;
 b=Mor/L1VCBTcTSQq8gPtqeEbwGmORboHuX0GroW5y1Mi1d/XjrwBkMu6lrDGZ91g/Nu
 eTtZ4jeUOMG4fr8d7wQe1hiZefqBUtnimRhDx7VU1V1YENIZygpet/ymX+jH+RmLNpC+
 GtcBHZAxX0nU9sRpKNo7vpajokQxD9+DImV45TgO4E/9Jcf8bS/UtRnL0AiW5rxousIj
 NarQUlRpf1/ZzihSvuN+cRthAaAT6gI8awa5S/ni2znB+Kd4x17AXiNU2LbJtdu5L1P5
 Q9fFD6b4cZ2roADRrcwYiQQRMa6cNdqreqCXWpk6RKH2YdYiYp5CPES5Iar2XKc2iyIZ
 gJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744511703; x=1745116503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=voNzLC5BpZqgahsmn4i6sfJIo0eN2XsIk1qhy/YQ5C4=;
 b=Zkpw4K+IvB2zJvslI2P4OrnBQSFmJG4lKlP7KId+VNq4gSZZULuyUfKtUPXXSgeDx6
 6AF7rk+C1dMhUfxS0HRlTaSP3lsNRmMCOS9paOLsdzCePxqAHYf4M/HfbY0BNXdgXvGE
 3OTTszXK8gPIbV9HVRO0h9nFpP/qHW9CumPRVdccqPERiKCn/RtgE4uQY/ZdJpG6zmuD
 YUJRRyGdhu7syPyCOTOsfKFNmdBkWdo1czm5NQGSHrDGCXHFP3z3QaGjDoUfFUNgz9Hp
 07jv04vByesMPPXVv4qmTyi5kNpo2PDAvB9Dg6kaEgRknz8ekiLsH62Wqf2SEWd2ByY7
 yIqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC83LYJtOdJcD+HNEDSeh7FdClTt88sXs3c5ARu7DPBdgP6XX+VLB16ToC0lrF3za0HgqIcMtnV7J5CgyCa+g=@lists.samba.org
X-Gm-Message-State: AOJu0YwVb7tL5mLOFAbn/rqWE+Ib5j7Zk8Qgl7noBn1muD/BZD+ndess
 xopUYJbqUQ+bsy5gY2owyBQpirURH8gtnbs/PCeZt+5iGn8QLHEg+pl6siu7e8olCfn5vGssdQG
 eV71VVjn484GcPsrSfgEsXzItHOA=
X-Gm-Gg: ASbGncuJkZwdPxJu5Sj3+pwgxYz5CW0T45Y535K9gZ5ouK5W70wcBsrhkT5OXtqhSxS
 SgM0uRTiAl2eddRZY6XzLoKDk7zb/HvER3m37ibDlsHe5PMEGZQOdAs4uoX/Rt+keDIRPdgVhIe
 zxgVFWQBMPla5DFzan2ZWlm/q7WME0DWMgixITqdUO4bs4ayZGSZx606M=
X-Google-Smtp-Source: AGHT+IFkJMuhscB0t/wGepHGii7v7OeOBtSZxU89B87lbuDOvCgRZij9Gr+S7P9UDXybO/4ymG/oBqZ0sZif/8kVZoI=
X-Received: by 2002:a05:6512:2242:b0:549:8f06:8229 with SMTP id
 2adb3069b0e04-54d452d7a45mr1891146e87.49.1744511702719; Sat, 12 Apr 2025
 19:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv27yTcE3wjSOj1vQ8S1Lgbw3LdAevNtB5UiAF24yWoaw@mail.gmail.com>
 <20250411061201.122232-1-chunjie.zhu@cloud.com>
In-Reply-To: <20250411061201.122232-1-chunjie.zhu@cloud.com>
Date: Sat, 12 Apr 2025 21:34:50 -0500
X-Gm-Features: ATxdqUHQWRjO7jiNBLCPvnF3OMl-DM6VczQEEdoPcqMjASxibFa5B04LYDCsgUs
Message-ID: <CAH2r5muisewc_rrW0Z-teq9eJS2xE+82cUyR9sBSUkPF8yOHAQ@mail.gmail.com>
Subject: Re: [PATCH v2] fix open hardlink on deferred close file error
To: Chunjie Zhu <chunjie.zhu@cloud.com>
Content-Type: multipart/mixed; boundary="0000000000005904d106329fc850"
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 Enzo Matsumiya <ematsumiya@suse.de>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, ross.lagerwall@cloud.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000005904d106329fc850
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Have rebased the patch so it would merge onto current for-next
(6.15-rc1+), and cleanup a checkpatch warning and added Cc:stable

Have tentatively merged the updated patch (see attached) into cifs-2.6.git
Although I tested that it does fix the problem described in the commit
description, additional review/testing would be welcome.

On Fri, Apr 11, 2025 at 1:13=E2=80=AFAM Chunjie Zhu <chunjie.zhu@cloud.com>=
 wrote:
>
> The following Python script results in unexpected behaviour when run on
> a CIFS filesystem against a Windows Server:
>
>     # Create file
>     fd =3D os.open('test', os.O_WRONLY|os.O_CREAT)
>     os.write(fd, b'foo')
>     os.close(fd)
>
>     # Open and close the file to leave a pending deferred close
>     fd =3D os.open('test', os.O_RDONLY|os.O_DIRECT)
>     os.close(fd)
>
>     # Try to open the file via a hard link
>     os.link('test', 'new')
>     newfd =3D os.open('new', os.O_RDONLY|os.O_DIRECT)
>
> The final open returns EINVAL due to the server returning
> STATUS_INVALID_PARAMETER. The root cause of this is that the client
> caches lease keys per inode, but the spec requires them to be related to
> the filename which causes problems when hard links are involved:
>
> From MS-SMB2 section 3.3.5.9.11:
>
> "The server MUST attempt to locate a Lease by performing a lookup in the
> LeaseTable.LeaseList using the LeaseKey in the
> SMB2_CREATE_REQUEST_LEASE_V2 as the lookup key. If a lease is found,
> Lease.FileDeleteOnClose is FALSE, and Lease.Filename does not match the
> file name for the incoming request, the request MUST be failed with
> STATUS_INVALID_PARAMETER"
>
> On client side, we first check the context of file open, if it hits above
> conditions, we first close all opening files which are belong to the same
> inode, then we do open the hard link file.
>
> Signed-off-by: Chunjie Zhu <chunjie.zhu@cloud.com>
> ---
>
> v2: if error, first close inode opening files and then open hard link
>
>  fs/smb/client/cifsproto.h |  2 ++
>  fs/smb/client/file.c      | 29 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index 260a6299bddb..b563c227792e 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -157,6 +157,8 @@ extern int cifs_get_writable_path(struct cifs_tcon *t=
con, const char *name,
>  extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *, b=
ool);
>  extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char *na=
me,
>                                   struct cifsFileInfo **ret_file);
> +extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *=
inode,
> +                                 struct file *file);
>  extern unsigned int smbCalcSize(void *buf);
>  extern int decode_negTokenInit(unsigned char *security_blob, int length,
>                         struct TCP_Server_Info *server);
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 4cbb5487bd8d..8e9582ff70f3 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -751,6 +751,12 @@ int cifs_open(struct inode *inode, struct file *file=
)
>                 } else {
>                         _cifsFileInfo_put(cfile, true, false);
>                 }
> +       } else {
> +               /* hard link on the defeered close file */
> +               rc =3D cifs_get_hardlink_path(tcon, inode, file);
> +               if (rc) {
> +                       cifs_close_deferred_file(CIFS_I(inode));
> +               }
>         }
>
>         if (server->oplocks)
> @@ -2413,6 +2419,29 @@ cifs_get_readable_path(struct cifs_tcon *tcon, con=
st char *name,
>         return -ENOENT;
>  }
>
> +int
> +cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
> +                               struct file *file)
> +{
> +       struct cifsFileInfo *open_file =3D NULL;
> +       struct cifsInodeInfo *cinode =3D CIFS_I(inode);
> +       int rc =3D 0;
> +
> +       spin_lock(&tcon->open_file_lock);
> +       spin_lock(&cinode->open_file_lock);
> +
> +       list_for_each_entry(open_file, &cinode->openFileList, flist) {
> +               if (file->f_flags =3D=3D open_file->f_flags) {
> +                       rc =3D -EINVAL;
> +                       break;
> +               }
> +       }
> +
> +       spin_unlock(&cinode->open_file_lock);
> +       spin_unlock(&tcon->open_file_lock);
> +       return rc;
> +}
> +
>  void
>  cifs_writedata_release(struct kref *refcount)
>  {
> --
> 2.34.1
>


--=20
Thanks,

Steve

--0000000000005904d106329fc850
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-smb3-client-fix-open-hardlink-on-deferred-close-file.patch"
Content-Disposition: attachment; 
	filename="0002-smb3-client-fix-open-hardlink-on-deferred-close-file.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m9f16ukj0>
X-Attachment-Id: f_m9f16ukj0

RnJvbSBiNWU5MDllZDgzNWM5NmIzNmQ1MzZiNjZlODc2N2YyMGRmYjEzNTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVuamllIFpodSA8Y2h1bmppZS56aHVAY2xvdWQuY29tPgpE
YXRlOiBTYXQsIDEyIEFwciAyMDI1IDIxOjE1OjU1IC0wNTAwClN1YmplY3Q6IFtQQVRDSCAyLzJd
IHNtYjMgY2xpZW50OiBmaXggb3BlbiBoYXJkbGluayBvbiBkZWZlcnJlZCBjbG9zZSBmaWxlCiBl
cnJvcgoKVGhlIGZvbGxvd2luZyBQeXRob24gc2NyaXB0IHJlc3VsdHMgaW4gdW5leHBlY3RlZCBi
ZWhhdmlvdXIgd2hlbiBydW4gb24KYSBDSUZTIGZpbGVzeXN0ZW0gYWdhaW5zdCBhIFdpbmRvd3Mg
U2VydmVyOgoKICAgICMgQ3JlYXRlIGZpbGUKICAgIGZkID0gb3Mub3BlbigndGVzdCcsIG9zLk9f
V1JPTkxZfG9zLk9fQ1JFQVQpCiAgICBvcy53cml0ZShmZCwgYidmb28nKQogICAgb3MuY2xvc2Uo
ZmQpCgogICAgIyBPcGVuIGFuZCBjbG9zZSB0aGUgZmlsZSB0byBsZWF2ZSBhIHBlbmRpbmcgZGVm
ZXJyZWQgY2xvc2UKICAgIGZkID0gb3Mub3BlbigndGVzdCcsIG9zLk9fUkRPTkxZfG9zLk9fRElS
RUNUKQogICAgb3MuY2xvc2UoZmQpCgogICAgIyBUcnkgdG8gb3BlbiB0aGUgZmlsZSB2aWEgYSBo
YXJkIGxpbmsKICAgIG9zLmxpbmsoJ3Rlc3QnLCAnbmV3JykKICAgIG5ld2ZkID0gb3Mub3Blbign
bmV3Jywgb3MuT19SRE9OTFl8b3MuT19ESVJFQ1QpCgpUaGUgZmluYWwgb3BlbiByZXR1cm5zIEVJ
TlZBTCBkdWUgdG8gdGhlIHNlcnZlciByZXR1cm5pbmcKU1RBVFVTX0lOVkFMSURfUEFSQU1FVEVS
LiBUaGUgcm9vdCBjYXVzZSBvZiB0aGlzIGlzIHRoYXQgdGhlIGNsaWVudApjYWNoZXMgbGVhc2Ug
a2V5cyBwZXIgaW5vZGUsIGJ1dCB0aGUgc3BlYyByZXF1aXJlcyB0aGVtIHRvIGJlIHJlbGF0ZWQg
dG8KdGhlIGZpbGVuYW1lIHdoaWNoIGNhdXNlcyBwcm9ibGVtcyB3aGVuIGhhcmQgbGlua3MgYXJl
IGludm9sdmVkOgoKRnJvbSBNUy1TTUIyIHNlY3Rpb24gMy4zLjUuOS4xMToKCiJUaGUgc2VydmVy
IE1VU1QgYXR0ZW1wdCB0byBsb2NhdGUgYSBMZWFzZSBieSBwZXJmb3JtaW5nIGEgbG9va3VwIGlu
IHRoZQpMZWFzZVRhYmxlLkxlYXNlTGlzdCB1c2luZyB0aGUgTGVhc2VLZXkgaW4gdGhlClNNQjJf
Q1JFQVRFX1JFUVVFU1RfTEVBU0VfVjIgYXMgdGhlIGxvb2t1cCBrZXkuIElmIGEgbGVhc2UgaXMg
Zm91bmQsCkxlYXNlLkZpbGVEZWxldGVPbkNsb3NlIGlzIEZBTFNFLCBhbmQgTGVhc2UuRmlsZW5h
bWUgZG9lcyBub3QgbWF0Y2ggdGhlCmZpbGUgbmFtZSBmb3IgdGhlIGluY29taW5nIHJlcXVlc3Qs
IHRoZSByZXF1ZXN0IE1VU1QgYmUgZmFpbGVkIHdpdGgKU1RBVFVTX0lOVkFMSURfUEFSQU1FVEVS
IgoKT24gY2xpZW50IHNpZGUsIHdlIGZpcnN0IGNoZWNrIHRoZSBjb250ZXh0IG9mIGZpbGUgb3Bl
biwgaWYgaXQgaGl0cyBhYm92ZQpjb25kaXRpb25zLCB3ZSBmaXJzdCBjbG9zZSBhbGwgb3Blbmlu
ZyBmaWxlcyB3aGljaCBhcmUgYmVsb25nIHRvIHRoZSBzYW1lCmlub2RlLCB0aGVuIHdlIGRvIG9w
ZW4gdGhlIGhhcmQgbGluayBmaWxlLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVk
LW9mZi1ieTogQ2h1bmppZSBaaHUgPGNodW5qaWUuemh1QGNsb3VkLmNvbT4KU2lnbmVkLW9mZi1i
eTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KCnYyOiBpZiBlcnJv
ciwgZmlyc3QgY2xvc2UgaW5vZGUgb3BlbmluZyBmaWxlcyBhbmQgdGhlbiBvcGVuIGhhcmQgbGlu
awotLS0KIGZzL3NtYi9jbGllbnQvY2lmc3Byb3RvLmggfCAgMiArKwogZnMvc21iL2NsaWVudC9m
aWxlLmMgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvY2lmc3By
b3RvLmggYi9mcy9zbWIvY2xpZW50L2NpZnNwcm90by5oCmluZGV4IGNmY2MwNzkwNWJkZi4uNTlm
NmZkZmU1NjBlIDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNwcm90by5oCisrKyBiL2Zz
L3NtYi9jbGllbnQvY2lmc3Byb3RvLmgKQEAgLTE2Myw2ICsxNjMsOCBAQCBleHRlcm4gaW50IGNp
ZnNfZ2V0X3dyaXRhYmxlX3BhdGgoc3RydWN0IGNpZnNfdGNvbiAqdGNvbiwgY29uc3QgY2hhciAq
bmFtZSwKIGV4dGVybiBzdHJ1Y3QgY2lmc0ZpbGVJbmZvICpmaW5kX3JlYWRhYmxlX2ZpbGUoc3Ry
dWN0IGNpZnNJbm9kZUluZm8gKiwgYm9vbCk7CiBleHRlcm4gaW50IGNpZnNfZ2V0X3JlYWRhYmxl
X3BhdGgoc3RydWN0IGNpZnNfdGNvbiAqdGNvbiwgY29uc3QgY2hhciAqbmFtZSwKIAkJCQkgIHN0
cnVjdCBjaWZzRmlsZUluZm8gKipyZXRfZmlsZSk7CitleHRlcm4gaW50IGNpZnNfZ2V0X2hhcmRs
aW5rX3BhdGgoc3RydWN0IGNpZnNfdGNvbiAqdGNvbiwgc3RydWN0IGlub2RlICppbm9kZSwKKwkJ
CQkgIHN0cnVjdCBmaWxlICpmaWxlKTsKIGV4dGVybiB1bnNpZ25lZCBpbnQgc21iQ2FsY1NpemUo
dm9pZCAqYnVmKTsKIGV4dGVybiBpbnQgZGVjb2RlX25lZ1Rva2VuSW5pdCh1bnNpZ25lZCBjaGFy
ICpzZWN1cml0eV9ibG9iLCBpbnQgbGVuZ3RoLAogCQkJc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAq
c2VydmVyKTsKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvZmlsZS5jIGIvZnMvc21iL2NsaWVu
dC9maWxlLmMKaW5kZXggODQwN2ZiMTA4NjY0Li45ZThmNDA0YjllNTYgMTAwNjQ0Ci0tLSBhL2Zz
L3NtYi9jbGllbnQvZmlsZS5jCisrKyBiL2ZzL3NtYi9jbGllbnQvZmlsZS5jCkBAIC0xMDA3LDYg
KzEwMDcsMTEgQEAgaW50IGNpZnNfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmls
ZSAqZmlsZSkKIAkJfSBlbHNlIHsKIAkJCV9jaWZzRmlsZUluZm9fcHV0KGNmaWxlLCB0cnVlLCBm
YWxzZSk7CiAJCX0KKwl9IGVsc2UgeworCQkvKiBoYXJkIGxpbmsgb24gdGhlIGRlZmVlcmVkIGNs
b3NlIGZpbGUgKi8KKwkJcmMgPSBjaWZzX2dldF9oYXJkbGlua19wYXRoKHRjb24sIGlub2RlLCBm
aWxlKTsKKwkJaWYgKHJjKQorCQkJY2lmc19jbG9zZV9kZWZlcnJlZF9maWxlKENJRlNfSShpbm9k
ZSkpOwogCX0KIAogCWlmIChzZXJ2ZXItPm9wbG9ja3MpCkBAIC0yMDcxLDYgKzIwNzYsMjkgQEAg
Y2lmc19tb3ZlX2xsaXN0KHN0cnVjdCBsaXN0X2hlYWQgKnNvdXJjZSwgc3RydWN0IGxpc3RfaGVh
ZCAqZGVzdCkKIAkJbGlzdF9tb3ZlKGxpLCBkZXN0KTsKIH0KIAoraW50CitjaWZzX2dldF9oYXJk
bGlua19wYXRoKHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sIHN0cnVjdCBpbm9kZSAqaW5vZGUsCisJ
CQkJc3RydWN0IGZpbGUgKmZpbGUpCit7CisJc3RydWN0IGNpZnNGaWxlSW5mbyAqb3Blbl9maWxl
ID0gTlVMTDsKKwlzdHJ1Y3QgY2lmc0lub2RlSW5mbyAqY2lub2RlID0gQ0lGU19JKGlub2RlKTsK
KwlpbnQgcmMgPSAwOworCisJc3Bpbl9sb2NrKCZ0Y29uLT5vcGVuX2ZpbGVfbG9jayk7CisJc3Bp
bl9sb2NrKCZjaW5vZGUtPm9wZW5fZmlsZV9sb2NrKTsKKworCWxpc3RfZm9yX2VhY2hfZW50cnko
b3Blbl9maWxlLCAmY2lub2RlLT5vcGVuRmlsZUxpc3QsIGZsaXN0KSB7CisJCWlmIChmaWxlLT5m
X2ZsYWdzID09IG9wZW5fZmlsZS0+Zl9mbGFncykgeworCQkJcmMgPSAtRUlOVkFMOworCQkJYnJl
YWs7CisJCX0KKwl9CisKKwlzcGluX3VubG9jaygmY2lub2RlLT5vcGVuX2ZpbGVfbG9jayk7CisJ
c3Bpbl91bmxvY2soJnRjb24tPm9wZW5fZmlsZV9sb2NrKTsKKwlyZXR1cm4gcmM7Cit9CisKIHZv
aWQKIGNpZnNfZnJlZV9sbGlzdChzdHJ1Y3QgbGlzdF9oZWFkICpsbGlzdCkKIHsKLS0gCjIuNDMu
MAoK
--0000000000005904d106329fc850--

