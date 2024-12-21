Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9E9F9EE9
	for <lists+samba-technical@lfdr.de>; Sat, 21 Dec 2024 08:04:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pF6L1FiTYLHuGgql3LWJJBIHwRV7S/ubVB7BcZVR+/I=; b=2LHaKu/KP0bXLOgHXy43+PNuMu
	pDh1XFNIB0mqJ50gn4coyabWrShG7RT3AKtJcNAxX9Lk2Ug0fLTNuEfAclqT6e5a+70/FwWhzkUao
	lAgWtqFHv092TzTJW0UdmzB1hLu7hnYXUG3R9O8SoapHlPT4SMtBDBzIcz9InmutnX9VCXSrtRtyx
	kxMPUX0f0J9XIDagCuEmdHI4yd9A8bNWXfLsUXENNnyonA2IBACbkTboGvBbKDeCYWgdY2unENV/o
	ZaWuwz4PIYys9SfzXI5iDDgM+k0rWTgSL73oWwml8lwOEltEXZH/cgCWwzYx5qMFf1mLeKO0WXC7h
	h0sByS+w==;
Received: from ip6-localhost ([::1]:51724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tOtWZ-004hS0-JJ; Sat, 21 Dec 2024 07:03:43 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:53321) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tOtWR-004hRs-Do
 for samba-technical@lists.samba.org; Sat, 21 Dec 2024 07:03:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7fdc6e04411so1731935a12.2
 for <samba-technical@lists.samba.org>; Fri, 20 Dec 2024 23:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20230601.gappssmtp.com; s=20230601; t=1734764612;
 x=1735369412; darn=lists.samba.org; 
 h=cc:subject:from:to:content-language:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pF6L1FiTYLHuGgql3LWJJBIHwRV7S/ubVB7BcZVR+/I=;
 b=YNfJSDJb3j3ZCVudhXH36KNyiyQVV3qnDbIIWCj6RQPZ3Z+jU/3A5TbjssSGIyHbV8
 7yCbmilVNs0xucHgwE93vtMQ3bbL2wTvZoPIBgzclIrs/JIaaMwxlZuOrz0w93dYs6xE
 Tov9ZW/NbxKaBS8hLsI+DaBccZg60IHHVTcn5AR7V++7K/CbVSPSy+L7dVaAbYkcRpQc
 EuXkbNk4rpqOtW1Q+OfXrw3Gz0QfBaA8ENAZbPE/c36/ik2oe9WFu85kbSADHlqZ9uE3
 1f7kN41ibIz7p4n4H4ReXhlQyHAhsLPxW4E6piP1Bf1NhP6IeamHypX7KshsMKrn9mII
 mKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734764612; x=1735369412;
 h=cc:subject:from:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pF6L1FiTYLHuGgql3LWJJBIHwRV7S/ubVB7BcZVR+/I=;
 b=wNLq4v5dXf7XJGAwtv7krtyrmgjP1VnZ/mcdDJjCbqzwwfIdm7xKnshc7HJZlpdAcY
 oP1TUi5XOLTGFxERLubr3xKM1Y4J2EmbPzGg7FMovPKcAE67SxMTGJs10Dq5Bc+YN5+i
 QRPXqcAhUuJpKT6/sl6j6B1zUckZnmWFLXDgTEo5iCkLk+bS51Gu++b/4lXuotVsvG+0
 b1wxmu8Ek7SFQ8Rl1IrjyjzE9WVjDzoCBgNs10Cl7ISwjX2MTlywMHZW0SKdXbuIwPKr
 6l+IgscxGzx+NBtFJUgm4s5dVAv8TSEEtwlx8XHYz/mwBnb1VaeSGD8piuXT+pGCkiHS
 DwuQ==
X-Gm-Message-State: AOJu0Yxtd3bPA4oNda/WW2B9neQ3or+Nrk2AK4S5h7mxw3wshDE6JGzi
 UIRNEuo3Xl/7fnS33DpOeB8jOLadB+aRsTNUucAYosiisDF7KVYUynWY1R6kZyQo4nR9SC4H83z
 p
X-Gm-Gg: ASbGncsoq3Hn8rfShsEAnxFx3esAMctyOOg60XfY5T3QFNpE7vn5jREyqMory0pi9eu
 kiWaCXdTt41ZZTqVM+HXYHBseTih1q5G24mqEWqUZyVxwHUFKo82Ty2Pt1ePrb0wEzi1fD73A6B
 wd2Fo9Qid+LyvtKrpsIqLIXQtkEQlHZw85jvFcxUmLdQHO8TSTWXH4ZCK2upc2XdFCxm5dPrIzU
 l3PAfKDi/XxdRsQuQYoKE/1QEVtA6mLvJVOh2kJRycsr61vmpnF5ALJOOcNyrsmv818431REbGX
 z9BAkO4PnUgYxtCfM0q+mZFZsmigRjDcYA==
X-Google-Smtp-Source: AGHT+IEEw7JGysDD3zn9J/qUZOn9FYgPXlfqA398R9vj7veIdbXOOoNuoiES9FZN+DE7fVJom4ixIg==
X-Received: by 2002:a17:90b:54c3:b0:2ee:8439:dc8 with SMTP id
 98e67ed59e1d1-2f452ee6374mr7914107a91.34.1734764612080; 
 Fri, 20 Dec 2024 23:03:32 -0800 (PST)
Received: from ?IPV6:2407:7000:96d8:f484:6af7:28ff:fefd:2ef6?
 ([2407:7000:96d8:f484:6af7:28ff:fefd:2ef6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f4478accb3sm4360307a91.51.2024.12.20.23.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 23:03:31 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------FOvbVIl13Rb7PXLwjeL1tIF0"
Message-ID: <06ffa961-fc2f-4d22-9e47-e2c007e62b3e@mattgrant.net.nz>
Date: Sat, 21 Dec 2024 20:03:27 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: Open SSH kerberos auth not working with 4.21.x keytabs as server
 principals are in caps/mixed case - keytab breaks RFS 4120, section 6.2.1,
 fix for 4.21.3 please?
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
Cc: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------FOvbVIl13Rb7PXLwjeL1tIF0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!


Any thoughts on including fix for Bug #15759 for 4.21.3 please? 'sync 
machine password to keytab' sync_spns is producing non functional key 
tabs - patch below to lower case default generated parts of service 
principal names in Unix keytabs


Its a major functionality breaker.


Thank you!


Matt Grant






--------------FOvbVIl13Rb7PXLwjeL1tIF0
Content-Type: text/x-patch; charset=UTF-8;
 name="libads-keytab-lwrcase-spns.patch"
Content-Disposition: attachment; filename="libads-keytab-lwrcase-spns.patch"
Content-Transfer-Encoding: base64

SW5kZXg6IHNhbWJhL3NvdXJjZTMvbGliYWRzL2tlcmJlcm9zX2tleXRhYi5jCj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KLS0tIHNhbWJhLm9yaWcvc291cmNlMy9saWJhZHMva2VyYmVyb3Nfa2V5dGFiLmMK
KysrIHNhbWJhL3NvdXJjZTMvbGliYWRzL2tlcmJlcm9zX2tleXRhYi5jCkBAIC00MDksNiAr
NDA5LDggQEAgc3RhdGljIEFEU19TVEFUVVMgcHcya3RfcHJvY2Vzc19rZXl0YWIocwogCWty
YjVfa3ZubyBrdm5vID0gLTE7CiAJc2l6ZV90IGksIGosIGxlbjEgPSAwLCBsZW4yID0gMDsK
IAljaGFyICpwcmluY19zID0gTlVMTDsKKwljaGFyICpzcG5fbG93ZXJfcHJpbmNfcyA9IE5V
TEw7CisJY2hhciAqbG93ZXJfbmFtZV9zID0gTlVMTDsKIAljb25zdCBjaGFyICoqbmV0Ymlv
c19hbGlhcyA9IE5VTEw7CiAJY29uc3QgY2hhciAqKmFkZGxfaG9zdG5hbWVzID0gTlVMTDsK
IAlzaXplX3QgKmluZGV4X2FycmF5MSA9IE5VTEw7CkBAIC00OTYsNyArNDk4LDEwIEBAIHN0
YXRpYyBBRFNfU1RBVFVTIHB3Mmt0X3Byb2Nlc3Nfa2V5dGFiKHMKIAkJYnJlYWs7CiAJY2Fz
ZSBTUE5fU1BFQ19TWU5DOgogCQlmb3IgKGkgPSAwOyBpIDwgc3RhdGUtPmFkX251bV9zcG5z
OyBpKyspIHsKLQkJCUFERF9JTkZPKHN0YXRlLT5hZF9zcG5fYXJyYXlbaV0pOworCQkJLyog
SW1wbGVtZW50IFJGQzQyMDEgc2VjdGluIDYuMi4xICovCisJCQlzcG5fbG93ZXJfcHJpbmNf
cyA9IHN0cmxvd2VyX3RhbGxvYyh0YWxsb2NfdG9zKCksCisJCQkJCQkJICAgIHN0YXRlLT5h
ZF9zcG5fYXJyYXlbaV0pOworCQkJQUREX0lORk8oc3BuX2xvd2VyX3ByaW5jX3MpOwogCQl9
CiAJCWJyZWFrOwogCWNhc2UgU1BOX1NQRUNfRlVMTDoKQEAgLTUwNiwxMCArNTExLDEzIEBA
IHN0YXRpYyBBRFNfU1RBVFVTIHB3Mmt0X3Byb2Nlc3Nfa2V5dGFiKHMKIAkJYnJlYWs7CiAJ
Y2FzZSBTUE5fU1BFQ19QUkVGSVg6CiAJCWZvciAoaSA9IDA7IGkgPCBrZXl0YWJwdHItPm51
bV9zcG5fc3BlYzsgaSsrKSB7CisJCQkvKiBJbXBsZW1lbnQgUkZDNDIwMSBzZWN0aW4gNi4y
LjEgKi8KKwkJCWxvd2VyX25hbWVfcyA9IHN0cmxvd2VyX3RhbGxvYyh0YWxsb2NfdG9zKCks
CisJCQkJCQkgICAgICAgbHBfbmV0Ymlvc19uYW1lKCkpOwogCQkJcHJpbmNfcyA9IHRhbGxv
Y19hc3ByaW50Zih0YWxsb2NfdG9zKCksCiAJCQkJCQkgICIlcy8lc0AlcyIsCiAJCQkJCQkg
IGtleXRhYnB0ci0+c3BuX3NwZWNfYXJyYXlbaV0sCi0JCQkJCQkgIGxwX25ldGJpb3NfbmFt
ZSgpLAorCQkJCQkJICBsb3dlcl9uYW1lX3MsCiAJCQkJCQkgIGxwX3JlYWxtKCkpOwogCQkJ
aWYgKHByaW5jX3MgPT0gTlVMTCkgewogCQkJCXJldHVybiBBRFNfRVJST1JfS1JCNShFTk9N
RU0pOwpAQCAtNTIzLDEyICs1MzEsMTUgQEAgc3RhdGljIEFEU19TVEFUVVMgcHcya3RfcHJv
Y2Vzc19rZXl0YWIocwogCQkJICAgICBuZXRiaW9zX2FsaWFzICE9IE5VTEwgJiYgKm5ldGJp
b3NfYWxpYXMgIT0gTlVMTDsKIAkJCSAgICAgbmV0Ymlvc19hbGlhcysrKQogCQkJeworCQkJ
CS8qIEltcGxlbWVudCBSRkM0MjAxIHNlY3RpbiA2LjIuMSAqLworCQkJCWxvd2VyX25hbWVf
cyA9IHN0cmxvd2VyX3RhbGxvYyh0YWxsb2NfdG9zKCksCisJCQkJCQkJICAgICAgICpuZXRi
aW9zX2FsaWFzKTsKIAkJCQkvKiBBZGQgUFJFRklYL25ldGJpb3NuYW1lQFJFQUxNICovCiAJ
CQkJcHJpbmNfcyA9IHRhbGxvY19hc3ByaW50ZigKIAkJCQkJdGFsbG9jX3RvcygpLAogCQkJ
CQkiJXMvJXNAJXMiLAogCQkJCQlrZXl0YWJwdHItPnNwbl9zcGVjX2FycmF5W2ldLAotCQkJ
CQkqbmV0Ymlvc19hbGlhcywKKwkJCQkJbG93ZXJfbmFtZV9zLAogCQkJCQlscF9yZWFsbSgp
KTsKIAkJCQlpZiAocHJpbmNfcyA9PSBOVUxMKSB7CiAJCQkJCXJldHVybiBBRFNfRVJST1Jf
S1JCNShFTk9NRU0pOwpAQCAtNTQwLDcgKzU1MSw3IEBAIHN0YXRpYyBBRFNfU1RBVFVTIHB3
Mmt0X3Byb2Nlc3Nfa2V5dGFiKHMKIAkJCQkJdGFsbG9jX3RvcygpLAogCQkJCQkiJXMvJXMu
JXNAJXMiLAogCQkJCQlrZXl0YWJwdHItPnNwbl9zcGVjX2FycmF5W2ldLAotCQkJCQkqbmV0
Ymlvc19hbGlhcywKKwkJCQkJbG93ZXJfbmFtZV9zLAogCQkJCQlscF9kbnNkb21haW4oKSwK
IAkJCQkJbHBfcmVhbG0oKSk7CiAJCQkJaWYgKHByaW5jX3MgPT0gTlVMTCkgewo=

--------------FOvbVIl13Rb7PXLwjeL1tIF0--

