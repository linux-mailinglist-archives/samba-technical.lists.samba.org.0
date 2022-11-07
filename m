Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E0361EA52
	for <lists+samba-technical@lfdr.de>; Mon,  7 Nov 2022 06:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=MuaR2yztmA+xHahWKpfxRbT0NKYcd0BoehNQJSOI5rM=; b=GtLdcP+4nrIlxnuFRB2WzPD08Q
	f7/1fCqwnWKzjMk7qpBSXc+khtdficGunLbGUcS8DkM8ggoQJOfcy07zFC+M/IKTkDIPXZDzSvizo
	Z8XcN2DqOy4Bmjo92AqCUUJV0J9nwFoXwB+lN0a6/jrr/dMPCK6QxVSYSy6r/45xlgLb5AYMJDVa8
	jUnY7JJuksYQwhNAAjcmw3hDw2QKM7u0fXYBNwnlbCjQzTVCFHthcWrSLWlM2f7nNGEVW9gSmn4dc
	YozCfenC0R49/q4eepweCd1wx/+9TJGI6mpTSYdf8NV2usd9i1Ee8IJL9NUtvUdmtc5MG71/ieFdx
	DHD7RWsQ==;
Received: from ip6-localhost ([::1]:29798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oruGV-00BDxq-3L; Mon, 07 Nov 2022 05:01:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41922) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oruGI-00BDxh-57
 for samba-technical@lists.samba.org; Mon, 07 Nov 2022 05:01:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so9302445pji.0
 for <samba-technical@lists.samba.org>; Sun, 06 Nov 2022 21:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iRgZEFp+XjfebFFkDESmSGXdyvcJhTJwiBJ3Qc2zH9g=;
 b=k3cdrtp3urUfnDzb2rSjsZoNodHHSjraaZAe9bfROziJc0/b2JekJcSwt6cym8eN40
 lA/WXLoX6whZu1e8kNDOZuSbOv8YxHIttQzjpRFASLOOeHe1bLU0T30NFM1Bf96O961P
 Tvb1Nw+EVoW8KXKIf15KE4+sjMjZND1BvKFcibo3IVymSgfGK6wcjKpf3DUXsJ8KyUuf
 HzmvpYOQdSRQueDWAQ3kTyk77nuIK0bNcA56O+fv+eYm2NCHly/omYygjtPtult17Flv
 DsE0g9pstOPWv0NVZIq6lHaO9NiTCKH4moiKVRK+JKnAn6TRVdLpgWmxPBz2OIXaq6Op
 K1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iRgZEFp+XjfebFFkDESmSGXdyvcJhTJwiBJ3Qc2zH9g=;
 b=qEGa/Mt7Uk6PgGtZhFuvKWFeu/daA7DizaGhUlfKfTNdnlZjnJXUDj35Q2AqggPShW
 Qw+GqhjbFMvf1LF2VgWtPmZwtylbFZ892hjgvUJ72fmvorLVwWA2jYOEkT0fwt1k6KH1
 gg4GJelotNRP56tgy/YQxvOhg6AjKUVOITfzga/RIfayayZxbv1SyynJo8wjtKHnwl52
 WeodGq9Xfp9rZYPcYjQ4xq60krT0kDTKrW57CdgNwSqZ7Pu8EDjMlDz6icQ75c4DiN+c
 ZB6nGyNlje4sEc0FKDq97GirThxQ/0rWxvdN0JiZ8XBW6soDZG1+JdMtJHXqQgptmTqW
 OrGQ==
X-Gm-Message-State: ACrzQf0XtXCx276aMrMXR2A1XeGrkBd9Ie7UA7AH0dvF1Yn8HyGGH6rc
 S687r6CAxUsMrjm4KHnUmz3WQ5GZk6T7N9bfnYuUFliPkzv1eQ==
X-Google-Smtp-Source: AMsMyM6F9AyJi386d0uKqZ15DNt4bkuw923GG/hN8zSGfKrnLowmbxrChQe8LvqbuXkTUCtnKW1/iCkHqiSQCUSrjug=
X-Received: by 2002:a17:902:ecc1:b0:186:b57e:d229 with SMTP id
 a1-20020a170902ecc100b00186b57ed229mr49688110plh.167.1667797282931; Sun, 06
 Nov 2022 21:01:22 -0800 (PST)
MIME-Version: 1.0
References: <CAHA-KoNnFFXfyB=vR-2F6oooTnGcPVHafQOVKQDpQjaDJa-0-g@mail.gmail.com>
 <CAHA-KoPuf=VhT4N_km-G8cnEzYDOVv42C7Yi8BOTw+heRHLJRg@mail.gmail.com>
In-Reply-To: <CAHA-KoPuf=VhT4N_km-G8cnEzYDOVv42C7Yi8BOTw+heRHLJRg@mail.gmail.com>
Date: Mon, 7 Nov 2022 18:01:12 +1300
Message-ID: <CAHA-KoPL7+N=BZz6a+6ZU_QPqjrDi9BO9dfeStNJD79DVW0dkw@mail.gmail.com>
Subject: Re: samba-tool gpo listall failing - what's going on please
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000009b7e2505ecda505c"
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

--0000000000009b7e2505ecda505c
Content-Type: text/plain; charset="UTF-8"

Hi!

Please find a patch for this problem attached.  Found that only AAAA reply
was being ignored, and an A requested, which of course gave no reply as not
in DNS!!!

Will get this attached to a bug report.

Cheers,

Matt

--
diff --git a/source4/libcli/resolve/dns_ex.c
b/source4/libcli/resolve/dns_ex.c
index 0bb3ba02287..0525d0d019a 100644
--- a/source4/libcli/resolve/dns_ex.c
+++ b/source4/libcli/resolve/dns_ex.c
@@ -81,7 +81,7 @@ struct dns_records_container {
  uint32_t count;
 };

-static int reply_to_addrs(TALLOC_CTX *mem_ctx, uint32_t *a_num,
+static int reply_to_addrs(TALLOC_CTX *mem_ctx, uint32_t *addr_num,
   char ***cur_addrs, uint32_t total,
   struct dns_request *reply, int port)
 {
@@ -151,8 +151,8 @@ static int reply_to_addrs(TALLOC_CTX *mem_ctx, uint32_t
*a_num,
  rr->name->pLabelList->label);
  if (addrs[total]) {
  total++;
- if (rr->type == QTYPE_A) {
- (*a_num)++;
+ if (rr->type == QTYPE_A || rr->type == QTYPE_AAAA) {
+ (*addr_num)++;
  }
  }
  }
@@ -211,7 +211,7 @@ static struct dns_records_container
get_a_aaaa_records(TALLOC_CTX *mem_ctx,
  struct dns_request *reply;
  struct dns_records_container ret;
  char **addrs = NULL;
- uint32_t a_num, total;
+ uint32_t addr_num, total;
  uint16_t qtype;
  TALLOC_CTX *tmp_ctx;
  DNS_ERROR err;
@@ -236,12 +236,13 @@ static struct dns_records_container
get_a_aaaa_records(TALLOC_CTX *mem_ctx,
  }
  }

- a_num = total = 0;
- total = reply_to_addrs(tmp_ctx, &a_num, &addrs, total, reply, port);
+ addr_num = total = 0;
+ total = reply_to_addrs(tmp_ctx, &addr_num, &addrs, total, reply, port);

- if (qtype == QTYPE_AAAA && a_num == 0) {
+ if (qtype == QTYPE_AAAA && addr_num == 0) {
  /*
- * DNS server didn't returned A when asked for AAAA records.
+ * DNS server didn't returned A when asked for AAAA records,
+ * and no AAAA record returned either
  * Most of the server do it, let's ask for A specificaly.
  */
  err = dns_lookup(tmp_ctx, name, QTYPE_A, &reply);
@@ -249,7 +250,7 @@ static struct dns_records_container
get_a_aaaa_records(TALLOC_CTX *mem_ctx,
  goto done;
  }

- total = reply_to_addrs(tmp_ctx, &a_num, &addrs, total,
+ total = reply_to_addrs(tmp_ctx, &addr_num, &addrs, total,
  reply, port);

  }


On Mon, 7 Nov 2022 at 15:04, Matt Grant <matt@mattgrant.net.nz> wrote:

> Hi!
>
> More information.  finddcs() fails if there is only an AAAA for the DC,
> and no A record!
>
> Pretty messy in there.  Should I be looking
> in source4/libcli/resolve/dns_ex.c, get_a_aaaa_records()?  That multi
> threaded stuff does not look very readable or debuggable...
>
> Debug level 12 is not giving me any useful traces.
>
> Cheers,
>
> Matt Grant
>
> On Mon, 7 Nov 2022 at 13:48, Matt Grant <matt@mattgrant.net.nz> wrote:
>
>> Hi!
>>
>> Got samba-tool gpo listall failing as well as the other samba-tool gpo
>> commands with the same error.  Command output follows.  This is on Samba
>> 4.16.5.
>>
>> Need to get it going to initialise and administer GPOs properly.
>>
>> Thank you!
>>
>> Matt Grant
>> --
>> smb-ad1: -admin- [~]
>> $ sudo samba-tool gpo listall -d3
>> lpcfg_load: refreshing parameters from /etc/samba/smb.conf
>> ldb_wrap open of secrets.ldb
>> GENSEC backend 'gssapi_spnego' registered
>> GENSEC backend 'gssapi_krb5' registered
>> GENSEC backend 'gssapi_krb5_sasl' registered
>> GENSEC backend 'spnego' registered
>> GENSEC backend 'schannel' registered
>> GENSEC backend 'ncalrpc_as_system' registered
>> GENSEC backend 'sasl-EXTERNAL' registered
>> GENSEC backend 'ntlmssp' registered
>> GENSEC backend 'ntlmssp_resume_ccache' registered
>> GENSEC backend 'http_basic' registered
>> GENSEC backend 'http_ntlm' registered
>> GENSEC backend 'http_negotiate' registered
>> GENSEC backend 'krb5' registered
>> GENSEC backend 'fake_gssapi_krb5' registered
>> interpret_interface: Adding interface fd14:828:ba69:12::2/64
>> interpret_interface: Adding interface fd14:828:ba69:12::2/64
>> interpret_interface: Adding interface fd14:828:ba69:12::2/64
>> interpret_interface: Adding interface fd14:828:ba69:12::2/64
>> resolve_lmhosts: Attempting lmhosts lookup for name _ldap._
>> tcp.SMB.ANATHOTH.NET<0x0>
>> dns child failed to find name '_ldap._tcp.SMB.ANATHOTH.NET' of type SRV
>> finddcs: Failed to find SRV record for _ldap._tcp.SMB.ANATHOTH.NET
>> ERROR(runtime): uncaught exception - ('Could not find a DC for domain',
>> NTSTATUSError(3221225524, 'The object name is not found.'))
>>   File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line
>> 186, in _run
>>     return self.run(*args, **kwargs)
>>   File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 469, in
>> run
>>     self.url = dc_url(self.lp, self.creds, H)
>>   File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 127, in
>> dc_url
>>     raise RuntimeError("Could not find a DC for domain", e)
>>
>> smb-ad1: -admin- [~]
>> $ view +127 /usr/lib/python3/dist-packages/samba/netcmd/gpo.py
>>
>> smb-ad1: -admin- [~]
>> $ host -t SRV _ldap._tcp.SMB.ANATHOTH.NET
>> _ldap._tcp.SMB.ANATHOTH.NET has SRV record 0 100 389
>> smb-ad1.smb.anathoth.net.
>>
>> smb-ad1: -admin- [~]
>> $ host smb-ad1.smb.anathoth.net.
>> smb-ad1.smb.anathoth.net has IPv6 address fd14:828:ba69:12::2
>>
>> smb-ad1: -admin- [~]
>> $
>>
>>

--0000000000009b7e2505ecda505c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="samba-finddcs-only-aaaa-in-dns-fix.patch"
Content-Disposition: attachment; 
	filename="samba-finddcs-only-aaaa-in-dns-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_la6bdvg00>
X-Attachment-Id: f_la6bdvg00

ZGlmZiAtLWdpdCBhL3NvdXJjZTQvbGliY2xpL3Jlc29sdmUvZG5zX2V4LmMgYi9zb3VyY2U0L2xp
YmNsaS9yZXNvbHZlL2Ruc19leC5jCmluZGV4IDBiYjNiYTAyMjg3Li4wNTI1ZDBkMDE5YSAxMDA2
NDQKLS0tIGEvc291cmNlNC9saWJjbGkvcmVzb2x2ZS9kbnNfZXguYworKysgYi9zb3VyY2U0L2xp
YmNsaS9yZXNvbHZlL2Ruc19leC5jCkBAIC04MSw3ICs4MSw3IEBAIHN0cnVjdCBkbnNfcmVjb3Jk
c19jb250YWluZXIgewogCXVpbnQzMl90IGNvdW50OwogfTsKIAotc3RhdGljIGludCByZXBseV90
b19hZGRycyhUQUxMT0NfQ1RYICptZW1fY3R4LCB1aW50MzJfdCAqYV9udW0sCitzdGF0aWMgaW50
IHJlcGx5X3RvX2FkZHJzKFRBTExPQ19DVFggKm1lbV9jdHgsIHVpbnQzMl90ICphZGRyX251bSwK
IAkJCSAgY2hhciAqKipjdXJfYWRkcnMsIHVpbnQzMl90IHRvdGFsLAogCQkJICBzdHJ1Y3QgZG5z
X3JlcXVlc3QgKnJlcGx5LCBpbnQgcG9ydCkKIHsKQEAgLTE1MSw4ICsxNTEsOCBAQCBzdGF0aWMg
aW50IHJlcGx5X3RvX2FkZHJzKFRBTExPQ19DVFggKm1lbV9jdHgsIHVpbnQzMl90ICphX251bSwK
IAkJCQkJCXJyLT5uYW1lLT5wTGFiZWxMaXN0LT5sYWJlbCk7CiAJCWlmIChhZGRyc1t0b3RhbF0p
IHsKIAkJCXRvdGFsKys7Ci0JCQlpZiAocnItPnR5cGUgPT0gUVRZUEVfQSkgewotCQkJCSgqYV9u
dW0pKys7CisJCQlpZiAocnItPnR5cGUgPT0gUVRZUEVfQSB8fCByci0+dHlwZSA9PSBRVFlQRV9B
QUFBKSB7CisJCQkJKCphZGRyX251bSkrKzsKIAkJCX0KIAkJfQogCX0KQEAgLTIxMSw3ICsyMTEs
NyBAQCBzdGF0aWMgc3RydWN0IGRuc19yZWNvcmRzX2NvbnRhaW5lciBnZXRfYV9hYWFhX3JlY29y
ZHMoVEFMTE9DX0NUWCAqbWVtX2N0eCwKIAlzdHJ1Y3QgZG5zX3JlcXVlc3QgKnJlcGx5OwogCXN0
cnVjdCBkbnNfcmVjb3Jkc19jb250YWluZXIgcmV0OwogCWNoYXIgKiphZGRycyA9IE5VTEw7Ci0J
dWludDMyX3QgYV9udW0sIHRvdGFsOworCXVpbnQzMl90IGFkZHJfbnVtLCB0b3RhbDsKIAl1aW50
MTZfdCBxdHlwZTsKIAlUQUxMT0NfQ1RYICp0bXBfY3R4OwogCUROU19FUlJPUiBlcnI7CkBAIC0y
MzYsMTIgKzIzNiwxMyBAQCBzdGF0aWMgc3RydWN0IGRuc19yZWNvcmRzX2NvbnRhaW5lciBnZXRf
YV9hYWFhX3JlY29yZHMoVEFMTE9DX0NUWCAqbWVtX2N0eCwKIAkJfQogCX0KIAotCWFfbnVtID0g
dG90YWwgPSAwOwotCXRvdGFsID0gcmVwbHlfdG9fYWRkcnModG1wX2N0eCwgJmFfbnVtLCAmYWRk
cnMsIHRvdGFsLCByZXBseSwgcG9ydCk7CisJYWRkcl9udW0gPSB0b3RhbCA9IDA7CisJdG90YWwg
PSByZXBseV90b19hZGRycyh0bXBfY3R4LCAmYWRkcl9udW0sICZhZGRycywgdG90YWwsIHJlcGx5
LCBwb3J0KTsKIAotCWlmIChxdHlwZSA9PSBRVFlQRV9BQUFBICYmIGFfbnVtID09IDApIHsKKwlp
ZiAocXR5cGUgPT0gUVRZUEVfQUFBQSAmJiBhZGRyX251bSA9PSAwKSB7CiAJCS8qCi0JCSogRE5T
IHNlcnZlciBkaWRuJ3QgcmV0dXJuZWQgQSB3aGVuIGFza2VkIGZvciBBQUFBIHJlY29yZHMuCisJ
CSogRE5TIHNlcnZlciBkaWRuJ3QgcmV0dXJuZWQgQSB3aGVuIGFza2VkIGZvciBBQUFBIHJlY29y
ZHMsCisJCSogYW5kIG5vIEFBQUEgcmVjb3JkIHJldHVybmVkIGVpdGhlcgogCQkqIE1vc3Qgb2Yg
dGhlIHNlcnZlciBkbyBpdCwgbGV0J3MgYXNrIGZvciBBIHNwZWNpZmljYWx5LgogCQkqLwogCQll
cnIgPSBkbnNfbG9va3VwKHRtcF9jdHgsIG5hbWUsIFFUWVBFX0EsICZyZXBseSk7CkBAIC0yNDks
NyArMjUwLDcgQEAgc3RhdGljIHN0cnVjdCBkbnNfcmVjb3Jkc19jb250YWluZXIgZ2V0X2FfYWFh
YV9yZWNvcmRzKFRBTExPQ19DVFggKm1lbV9jdHgsCiAJCQlnb3RvIGRvbmU7CiAJCX0KIAotCQl0
b3RhbCA9IHJlcGx5X3RvX2FkZHJzKHRtcF9jdHgsICZhX251bSwgJmFkZHJzLCB0b3RhbCwKKwkJ
dG90YWwgPSByZXBseV90b19hZGRycyh0bXBfY3R4LCAmYWRkcl9udW0sICZhZGRycywgdG90YWws
CiAJCQkJCXJlcGx5LCBwb3J0KTsKIAogCX0K
--0000000000009b7e2505ecda505c--

