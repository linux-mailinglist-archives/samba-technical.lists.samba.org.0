Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC985F2140
	for <lists+samba-technical@lfdr.de>; Sun,  2 Oct 2022 06:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=frD2tspOfbluMGzPF/+MsIp8eKrwPchyS8WQzZS0cEw=; b=jFT51yXuHyb3Hdw6rEHcMZ7HLH
	t4zjo+oLM0Vg2XmcFN15ypa35EmkwwMqQf33vW1bG66jkHwRVA2De05gr83Qe8dZ1GmMcMDRpMNUb
	OdkE7lrI2mn+LnBufq8PRUxG4Hb4+DIOS+CPgfdgjtFm6ylxp/xZjZ+HIW6lkTNVIg+E4Gho4fcdD
	q1AuG2RP3VQhwkkU31OviXA44Ljljzuj25xw/odX58uymhd2p2eH63yR10g58UQFooHGqtHLUguIy
	CvCVfXAvtonQTNgv19yiHfD5FWUmpbQgRJUiTPmRD5TkThmeFs65CWJovGRgpB5N3+dfLhI1YeGZ0
	VkDHcN0g==;
Received: from ip6-localhost ([::1]:53508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeqB0-0079Hk-JI; Sun, 02 Oct 2022 04:02:02 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:45793) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeqAs-0079Hb-39
 for samba-technical@lists.samba.org; Sun, 02 Oct 2022 04:01:59 +0000
Received: by mail-vk1-xa30.google.com with SMTP id bi53so4061383vkb.12
 for <samba-technical@lists.samba.org>; Sat, 01 Oct 2022 21:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=frD2tspOfbluMGzPF/+MsIp8eKrwPchyS8WQzZS0cEw=;
 b=pyytCyuUAZKS+Jp/Ig4XHght+9rdo51AmPI9xrF9dx4iZQ8CK1YuDWrpJ08IXZ/Qzn
 GqA5yDmNdSeANPAht3LBRj3sT0B4UvycsDo1pG+xPIpRaUYD0IA1CDP2yoJQUHimRRDE
 VVaBX7b2LUgN/XvOgJXe36JEDRHZRT5t8WDmMR/c3oFTP5ZOgZzfH2eD+6v9q8VONKfb
 pfPVo7Yvr8x+Obc3xrgp85tXdQhvnUYppw9tgeuVAPSdvTvtZuP30IDeWo+3k8kNKK1q
 AeMVLye+k+AFezEvvQGFqHuELFYZjrl/6/IglLYDkJY3Z1ff71t7vDBOHL619B64FAgk
 HWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=frD2tspOfbluMGzPF/+MsIp8eKrwPchyS8WQzZS0cEw=;
 b=ZF7UvSjFPZZJpSH+FkRgdIH+yTef2giyJlVnp1cu6VWSJbPItlcd+Pol6i8RmvgPjs
 Y4Zuh72Wlvkt4ubXwndUfUUvQi0n7zmSrGueDPHr8chXyPduveF3nvJttYwQNJ/xdHA0
 Zi8a54ZTiV+b2aGkv/YUzf8ePTCmHaesgZeJnF5mfh0XL2ciXBHSw4bUfo6837xyTTsA
 LaDobR6+BflrVYcjLQx/IymBqq+ILwTmNZtLWg5wO9qf84v6U0eojAZKhtJ93B1Rs3qC
 BJEbve1Fra+4jqAXDq75v4hKcmZJMq4Z7kWP2QNX0ReVVp8BjW/j9M9rUynNvkOWsFuD
 jmYQ==
X-Gm-Message-State: ACrzQf1BZBQqpiXU2FEjdi3+Q+mL7c9lEq+yZlgziXJg90FTWmIGwUFr
 KwW11/cDEk8+tw4gdJbeNphryV5lzlf9o7av2FEPUzHl
X-Google-Smtp-Source: AMsMyM4FgtckvR8L7vympMvig/WfTapEqo+WQZ9iWuaLwpSCjDYUVdiFi8hB0yuQ0BbhbrnkPgkn/6xBqaZHg1TMJ4g=
X-Received: by 2002:a05:6122:1043:b0:3a9:9506:c34e with SMTP id
 z3-20020a056122104300b003a99506c34emr2792984vkn.38.1664683307394; Sat, 01 Oct
 2022 21:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvM6a4dU3d7Mxer9jWP0xkA2hyF9PrkwreES5T11W9O9w@mail.gmail.com>
In-Reply-To: <CAH2r5mvM6a4dU3d7Mxer9jWP0xkA2hyF9PrkwreES5T11W9O9w@mail.gmail.com>
Date: Sat, 1 Oct 2022 23:01:36 -0500
Message-ID: <CAH2r5mtoZRrCY-jDCH72DSNXPMxYiu24cuRRguLyXDx6zKUvwg@mail.gmail.com>
Subject: Re: new SMB3.1.1 create contexts
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000033e9c305ea054963"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000033e9c305ea054963
Content-Type: text/plain; charset="UTF-8"

patch attached to add the four missing create context IDs to the kernel

On Sat, Oct 1, 2022 at 6:50 PM Steve French <smfrench@gmail.com> wrote:
>
> Noticed a few SMB3.1.1 create contexts missing from the Linux kernel
> code.  Any more beyond these four that are still missing?
>
> diff --git a/fs/smbfs_common/smb2pdu.h b/fs/smbfs_common/smb2pdu.h
> index 2cab413fffee..7d605db3bb3b 100644
> --- a/fs/smbfs_common/smb2pdu.h
> +++ b/fs/smbfs_common/smb2pdu.h
> @@ -1101,7 +1101,11 @@ struct smb2_change_notify_rsp {
>  #define SMB2_CREATE_REQUEST_LEASE              "RqLs"
>  #define SMB2_CREATE_DURABLE_HANDLE_REQUEST_V2  "DH2Q"
>  #define SMB2_CREATE_DURABLE_HANDLE_RECONNECT_V2        "DH2C"
> -#define SMB2_CREATE_TAG_POSIX
> "\x93\xAD\x25\x50\x9C\xB4\x11\xE7\xB4\x23\x83\xDE\x96\x8B\xCD\x7C"
> +#define SMB2_CREATE_TAG_POSIX
> "\x93\xAD\x25\x50\x9C\xB4\x11\xE7\xB4\x23\x83\xDE\x96\x8B\xCD\x7C"
> +#define SMB2_CREATE_APP_INSTANCE_ID
> "\x45\xBC\xA6\x6A\xEF\xA7\xF7\x4A\x90\x08\xFA\x46\x2E\x14\x4D\x74"
> +#define SMB2_CREATE_APP_INSTANCE_VERSION
> "\xB9\x82\xD0\xB7\x3B\x56\x07\x4F\xA0\x7B\x52\x4A\x81\x16\xA0\x10"
> +#define SVHDX_OPEN_DEVICE_CONTEXT
> "\x9C\xCB\xCF\x9E\x04\xC1\xE6\x43\x98\x0E\x15\x8D\xA1\xF6\xEC\x83"
> +#define SMB2_CREATE_TAG_AAPL                   "AAPL"
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--00000000000033e9c305ea054963
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0010-smb3-define-missing-create-contexts.patch"
Content-Disposition: attachment; 
	filename="0010-smb3-define-missing-create-contexts.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l8qtg7ll0>
X-Attachment-Id: f_l8qtg7ll0

RnJvbSAzMTNiMWY3Mzk2MDRiOTc4YmI5OTZhNmQ2MjBjMDExNjU3Y2UxYjRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAyMjo1MjoyMCAtMDUwMApTdWJqZWN0OiBbUEFUQ0ggMTAv
MTBdIHNtYjM6IGRlZmluZSBtaXNzaW5nIGNyZWF0ZSBjb250ZXh0cwoKVXBkYXRlIHRoZSBsaXN0
IG9mIGNyZWF0ZSBjb250ZXh0cyB0byBpbmNsdWRlIHRoZSB0aHJlZQptb3JlIHJlY2VudCBvbmVz
IGFuZCB0aGUgb25lIHVzZWQgZm9yIG1vdW50cyB0byBNYWNzLgoKU2lnbmVkLW9mZi1ieTogU3Rl
dmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYmZzX2NvbW1vbi9z
bWIycGR1LmggfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYmZzX2NvbW1vbi9zbWIycGR1LmggYi9mcy9z
bWJmc19jb21tb24vc21iMnBkdS5oCmluZGV4IDJjYWI0MTNmZmZlZS4uN2Q2MDVkYjNiYjNiIDEw
MDY0NAotLS0gYS9mcy9zbWJmc19jb21tb24vc21iMnBkdS5oCisrKyBiL2ZzL3NtYmZzX2NvbW1v
bi9zbWIycGR1LmgKQEAgLTExMDEsNyArMTEwMSwxMSBAQCBzdHJ1Y3Qgc21iMl9jaGFuZ2Vfbm90
aWZ5X3JzcCB7CiAjZGVmaW5lIFNNQjJfQ1JFQVRFX1JFUVVFU1RfTEVBU0UJCSJScUxzIgogI2Rl
ZmluZSBTTUIyX0NSRUFURV9EVVJBQkxFX0hBTkRMRV9SRVFVRVNUX1YyCSJESDJRIgogI2RlZmlu
ZSBTTUIyX0NSRUFURV9EVVJBQkxFX0hBTkRMRV9SRUNPTk5FQ1RfVjIJIkRIMkMiCi0jZGVmaW5l
IFNNQjJfQ1JFQVRFX1RBR19QT1NJWCAgICAgICAgICAiXHg5M1x4QURceDI1XHg1MFx4OUNceEI0
XHgxMVx4RTdceEI0XHgyM1x4ODNceERFXHg5Nlx4OEJceENEXHg3QyIKKyNkZWZpbmUgU01CMl9D
UkVBVEVfVEFHX1BPU0lYCQkiXHg5M1x4QURceDI1XHg1MFx4OUNceEI0XHgxMVx4RTdceEI0XHgy
M1x4ODNceERFXHg5Nlx4OEJceENEXHg3QyIKKyNkZWZpbmUgU01CMl9DUkVBVEVfQVBQX0lOU1RB
TkNFX0lECSJceDQ1XHhCQ1x4QTZceDZBXHhFRlx4QTdceEY3XHg0QVx4OTBceDA4XHhGQVx4NDZc
eDJFXHgxNFx4NERceDc0IgorI2RlZmluZSBTTUIyX0NSRUFURV9BUFBfSU5TVEFOQ0VfVkVSU0lP
TiAiXHhCOVx4ODJceEQwXHhCN1x4M0JceDU2XHgwN1x4NEZceEEwXHg3Qlx4NTJceDRBXHg4MVx4
MTZceEEwXHgxMCIKKyNkZWZpbmUgU1ZIRFhfT1BFTl9ERVZJQ0VfQ09OVEVYVAkiXHg5Q1x4Q0Jc
eENGXHg5RVx4MDRceEMxXHhFNlx4NDNceDk4XHgwRVx4MTVceDhEXHhBMVx4RjZceEVDXHg4MyIK
KyNkZWZpbmUgU01CMl9DUkVBVEVfVEFHX0FBUEwJCQkiQUFQTCIKIAogLyogRmxhZyAoU01CMyBv
cGVuIHJlc3BvbnNlKSB2YWx1ZXMgKi8KICNkZWZpbmUgU01CMl9DUkVBVEVfRkxBR19SRVBBUlNF
UE9JTlQgMHgwMQotLSAKMi4zNC4xCgo=
--00000000000033e9c305ea054963--

